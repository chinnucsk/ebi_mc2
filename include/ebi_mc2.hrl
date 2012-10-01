%
% Copyright 2012 Karolis Petrauskas
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%

%%
%%  Internal data structures for this application.
%%
-record(config_partition, {
    name            :: string(),
    max_parallel    :: integer()
}).
-record(config_cluster, {
    name            :: atom(),
    ssh_host        :: integer(),
    ssh_port        :: integer(),
    ssh_user        :: string(),
    local_user_dir  :: string(),
    cluster_command :: string(),
    status_check_ms :: integer(),
    partitions      :: [#config_partition{}]
}).
-record(config, {
    name            :: atom(),
    clusters = []   :: [#config_cluster{}]
}).


%%
%%
%%
-record(ebi_mc2_sim, {
    id              :: string(),
    sim,
    status          :: atom(),
    cmds = []       :: [atom()]
}).


%%
%%  External form for the queue configuration (Args).
%%
-type ebi_mc2_arg() :: {
    queue,
    [ebi_mc2_arg_cluster()]
}. 
-type ebi_mc2_arg_cluster() :: {
    cluster,
    ClusterName :: atom(),
    SshHost :: string(),
    SshPort :: integer(),
    SshUser :: string(),
    LocalUserDir :: string(),
    ClusterCommand :: string(),
    StatusCheckMS :: integer(),
    [ebi_mc2_arg_partition()]
}.
-type ebi_mc2_arg_partition() :: {
    partition,
    PartitionName :: atom(),
    MaxParallel :: integer()
}.