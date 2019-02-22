Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 648387D918
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Feb 2019 22:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbfBVWXC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Feb 2019 17:23:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:32683 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbfBVWXC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 22 Feb 2019 17:23:02 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Feb 2019 14:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,401,1544515200"; 
   d="gz'50?scan'50,208,50";a="126540148"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2019 14:22:59 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1gxJDe-00091O-LO; Sat, 23 Feb 2019 06:22:58 +0800
Date:   Sat, 23 Feb 2019 06:22:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     kbuild-all@01.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [lwn:docs-next 68/69] htmldocs: include/linux/lsm_hooks.h:1783:
 warning: Function parameter or member 'quotactl' not described in
 'security_list_options'
Message-ID: <201902230604.RT737SfF%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux-2.6 docs-next
head:   19c3fe285cbaa5aa36d60638fc5c37706f2a1c3e
commit: 80fcc98711a3980a8593d8ba4bd9cf9c7646fd60 [68/69] doc: security: Add kern-doc for lsm_hooks.h
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:555: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_leaf'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:555: warning: Function parameter or member 'end' not described in 'for_each_amdgpu_vm_pt_leaf'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:555: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_leaf'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:603: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:603: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:603: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:603: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:845: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_func'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1520: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_huge'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3096: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:128: warning: Incorrect use of kernel-doc format: Documentation Makefile include scripts source @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'atomic_obj_lock' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:203: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: no structured comments found
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_pin' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_unpin' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_res_obj' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_get_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_import_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_vmap' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_vunmap' not described in 'drm_driver'
   include/drm/drm_drv.h:618: warning: Function parameter or member 'gem_prime_mmap' not described in 'drm_driver'
   include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
   drivers/gpu/drm/drm_dp_helper.c:1362: warning: Function parameter or member 'dsc_dpcd' not described in 'drm_dp_dsc_sink_max_slice_count'
   drivers/gpu/drm/drm_dp_helper.c:1362: warning: Function parameter or member 'is_edp' not described in 'drm_dp_dsc_sink_max_slice_count'
   drivers/gpu/drm/i915/i915_vma.h:49: warning: cannot understand function prototype: 'struct i915_vma '
   drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
   drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
   drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
   include/linux/skbuff.h:876: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:876: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:238: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:238: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:513: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:513: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'switchdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member '____cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2048: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'quotactl' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'quota_on' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'sb_free_mnt_opts' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'sb_eat_lsm_opts' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'sb_kern_mount' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'sb_show_options' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'sb_add_mnt_opt' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'task_setioprio' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'task_getioprio' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'task_movememory' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'd_instantiate' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'setprocattr' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'secmark_refcount_inc' not described in 'security_list_options'
>> include/linux/lsm_hooks.h:1783: warning: Function parameter or member 'secmark_refcount_dec' not described in 'security_list_options'
   Documentation/admin-guide/cgroup-v2.rst:1509: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/admin-guide/cgroup-v2.rst:1511: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/admin-guide/cgroup-v2.rst:1512: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/interrupt.h:252: WARNING: Inline emphasis start-string without end-string.
   include/net/mac80211.h:1214: ERROR: Unexpected indentation.
   include/net/mac80211.h:1221: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:110: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/linux/wait.h:113: ERROR: Unexpected indentation.
   include/linux/wait.h:115: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/time/hrtimer.c:1120: WARNING: Block quote ends without a blank line; unexpected unindent.
   kernel/signal.c:344: WARNING: Inline literal start-string without end-string.
   include/linux/kernel.h:137: WARNING: Inline interpreted text or phrase reference start-string without end-string.
   Documentation/driver-api/dmaengine/dmatest.rst:63: ERROR: Unexpected indentation.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   Documentation/driver-api/gpio/board.rst:209: ERROR: Unexpected indentation.
   drivers/ata/libata-core.c:5959: ERROR: Unknown target name: "hw".
   drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/tty/serial/serial_core.c:1948: WARNING: Definition list ends without a blank line; unexpected unindent.
   include/linux/mtd/rawnand.h:1192: WARNING: Inline strong start-string without end-string.
   include/linux/mtd/rawnand.h:1194: WARNING: Inline strong start-string without end-string.
   include/linux/regulator/driver.h:287: ERROR: Unknown target name: "regulator_regmap_x_voltage".
   Documentation/driver-api/soundwire/locking.rst:50: ERROR: Inconsistent literal block quoting.
   Documentation/driver-api/soundwire/locking.rst:51: WARNING: Line block ends without a blank line.
   Documentation/driver-api/soundwire/locking.rst:55: WARNING: Inline substitution_reference start-string without end-string.
   Documentation/driver-api/soundwire/locking.rst:56: WARNING: Line block ends without a blank line.
   include/linux/spi/spi.h:368: ERROR: Unexpected indentation.
   fs/posix_acl.c:635: WARNING: Inline emphasis start-string without end-string.
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1575: WARNING: Inline emphasis start-string without end-string.
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1577: WARNING: Inline emphasis start-string without end-string.
   include/drm/drm_drv.h:664: ERROR: Unknown target name: "driver".
   Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:30: ERROR: Unexpected indentation.
   Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:42: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:62: ERROR: Unexpected indentation.
   Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:143: ERROR: Unexpected indentation.
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/dpaa2/index'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/e100'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/e1000'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/e1000e'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/fm10k'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/igb'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/igbvf'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/ixgb'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/ixgbe'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/ixgbevf'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/i40e'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/iavf'
   Documentation/networking/index.rst:6: WARNING: toctree contains reference to nonexisting document u'networking/ice'
   include/linux/netdevice.h:3462: WARNING: Inline emphasis start-string without end-string.
   include/linux/netdevice.h:3462: WARNING: Inline emphasis start-string without end-string.
   net/core/dev.c:4981: ERROR: Unknown target name: "page_is".
   Documentation/networking/snmp_counter.rst:1: WARNING: Title overline too short.

vim +1783 include/linux/lsm_hooks.h

3c4ed7bd Casey Schaufler 2015-05-02 @1783  

:::::: The code at line 1783 was first introduced by commit
:::::: 3c4ed7bdf5997d8020cbb8d4abbef2fcfb9f1284 LSM: Split security.h

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: James Morris <james.l.morris@oracle.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--Dxnq1zWXvFF0Q93v
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Dxnq1zWXvFF0Q93v--
