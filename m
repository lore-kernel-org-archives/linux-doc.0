Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848579;
	b=uxEX8elnlruAYgJsuntSGMfRcSKAQ6QryMLeAKjggK4UqHfwfhwDAALjwHJdoYrlivEr
	 yZGogdhX1Xfoh1XS4YmNRoEcfFeF6gC0P7fGhfMWnlOUHBMgvK1oS7wqUM5FNLfVHMNJQ
	 8GgUvA/V8bvuLjRL+9qq+eM8IoC7hlA6eQYnbNHG3l07zdyTHUbhMTCQAFiGWDBC0824k
	 acEo9BrabzN1zu/CECIjHd0/aaAlIUSfpvFDsgWCi+X5HCuKE5MUeh9rLnJUWQ1c76KPF
	 T6Qoz839hLivrWuo1RKPLdtQ1DN3q3scghb1lFMP7AvI5LmkCuJw7KBiUgdJAlX2Efg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848579;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eXDv5ob23h/pMojR1Vq13IBUL0Jk9jijucc19ODw/Ss=;
	b=JujOVjpJuCxyP5Dr2ZeXey67KA58bYlOHJBRNJqotXbrE1GDW9Up7E2Itqb5zVBr/uby
	 KyfG2hMERQm90N8KKwxVte3jV1lRLmqLmKNY0R/3iil5nxZ/WGjFNOYMf3NoG2t9wOBwS
	 IaoY9behxe1r+oZIa8hRZQJn1XWggJF6+ByUO2KDYEuP1HKsPyKLrSwFoP93cTZiJwPnc
	 VW3/8SWqGRhnPmgSWxzZ6RbyubaeAS8AzoHWWYd0UbmTy05Xo2rlL1G26eEbDEVCtYLD8
	 ALIdUzcpIpZ7wHlCmyvspnKyY25glfWQYZiScDysm1iTWL/+vwZR0Leh2nD45mk6PYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75EC606A324;
	Sat, 28 Nov 2026 06:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75EC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDmzRB6eQprquYJAA--.23829S2;
	Sat, 28 Nov 2026 14:49:30 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S10;
	Sat, 28 Nov 2026 14:49:30 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] docs/zh_CN: update networking/xfrm/xfrm_proc.rst translation
Date: Sat, 28 Nov 2026 14:49:15 +0800
Message-ID: <20261128064916.3481435-9-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261128064916.3481435-1-dzm91@hust.edu.cn>
References: <20261128064916.3481435-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDmzRB6eQprquYJAA--.23829S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4UtFyfWFW8tF1kCFykXwb_yoWxXF4rpF
	48KryfKF48C3Wakw48Gr1UGF18Ka1xCa12kF17Jw1vqr1kJrWYkrsxK39IkFyxGrWSkFW5
	XanrKrW5uryjyFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	WxJVW8Jr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r
	4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UGApnUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Move the XFRM proc translation to its current upstream location and
adjust the disclaimer include. Add an XFRM chapter index and update
the networking index to follow the English layout.

Track the English xfrm_proc.rst through commit 03e23b18c720
("net: Move XFRM documentation into its own subdirectory").

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/networking/index.rst   | 238 +++++++++---------
 .../zh_CN/networking/xfrm/index.rst           |  20 ++
 .../zh_CN/networking/{ => xfrm}/xfrm_proc.rst |   4 +-
 3 files changed, 138 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/networking/xfrm/index.rst
 rename Documentation/translations/zh_CN/networking/{ => xfrm}/xfrm_proc.rst (96%)

diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index bf22d22b64db..9f28240d6b14 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/networking/index.rst
-
 :翻译:
 
  王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
@@ -13,142 +11,140 @@
 网络
 ====
 
-有关网络设备（netdev）开发过程的详细指南，请参考：:ref:`netdev-FAQ`
+有关网络设备（netdev）开发流程的具体指南，请参阅 :ref:`netdev-FAQ`。
 
 目录：
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    msg_zerocopy
+   alias
    driver
+   generic-hdlc
    ipv6
+   mptcp-sysctl
    napi
-   secid
-   vxlan
    netif-msg
-   xfrm_proc
    netmem
-   alias
-   mptcp-sysctl
-   generic-hdlc
+   secid
    sriov
    team
    timestamping
+   vxlan
+   xfrm/index
 
 Todolist:
 
-*   af_xdp
-*   bareudp
-*   batman-adv
-*   can
-*   can_ucan_protocol
-*   device_drivers/index
-*   diagnostic/index
-*   dsa/index
-*   devlink/index
-*   ethtool-netlink
-*   ieee802154
-*   iso15765-2
-*   j1939
-*   kapi
-*   failover
-*   net_dim
-*   net_failover
-*   page_pool
-*   phy
-*   sfp-phylink
-*   bridge
-*   snmp_counter
-*   checksum-offloads
-*   segmentation-offloads
-*   scaling
-*   tls
-*   tls-offload
-*   tls-handshake
-*   nfc
-*   6lowpan
-*   6pack
-*   arcnet-hardware
-*   arcnet
-*   atm
-*   ax25
-*   bonding
-*   cdc_mbim
-*   dccp
-*   dctcp
-*   devmem
-*   dns_resolver
-*   eql
-*   fib_trie
-*   filter
-*   generic_netlink
-*   netlink_spec/index
-*   gen_stats
-*   gtp
-*   ila
-*   ioam6-sysctl
-*   ip_dynaddr
-*   ipsec
-*   ip-sysctl
-*   ipvlan
-*   ipvs-sysctl
-*   kcm
-*   l2tp
-*   lapb-module
-*   mac80211-injection
-*   mctp
-*   mpls-sysctl
-*   mptcp
-*   multiqueue
-*   multi-pf-netdev
-*   net_cachelines/index
-*   netconsole
-*   netdev-features
-*   netdevices
-*   netfilter-sysctl
-*   nexthop-group-resilient
-*   nf_conntrack-sysctl
-*   nf_flowtable
-*   oa-tc6-framework
-*   openvswitch
-*   operstates
-*   packet_mmap
-*   phonet
-*   phy-link-topology
-*   pktgen
-*   plip
-*   ppp_generic
-*   proc_net_tcp
-*   pse-pd/index
-*   radiotap-headers
-*   rds
-*   regulatory
-*   representors
-*   rxrpc
-*   sctp
-*   seg6-sysctl
-*   smc-sysctl
-*   statistics
-*   strparser
-*   switchdev
-*   sysfs-tagging
-*   tc-actions-env-rules
-*   tc-queue-filters
-*   tcp_ao
-*   tcp-thin
-*   tipc
-*   tproxy
-*   tuntap
-*   udplite
-*   vrf
-*   x25
-*   x25-iface
-*   xfrm_device
-*   xfrm_sync
-*   xfrm_sysctl
-*   xdp-rx-metadata
-*   xsk-tx-metadata
+* af_xdp
+* bareudp
+* batman-adv
+* can
+* can_ucan_protocol
+* device_drivers/index
+* diagnostic/index
+* dsa/index
+* devlink/index
+* ethtool-netlink
+* ieee802154
+* iso15765-2
+* j1939
+* kapi
+* failover
+* net_dim
+* net_failover
+* page_pool
+* phy
+* sfp-phylink
+* bridge
+* snmp_counter
+* checksum-offloads
+* segmentation-offloads
+* scaling
+* tls
+* tls-offload
+* tls-handshake
+* nfc
+* 6lowpan
+* arcnet-hardware
+* arcnet
+* atm
+* bonding
+* cdc_mbim
+* dctcp
+* devmem
+* dns_resolver
+* eql
+* fib_trie
+* filter
+* generic_netlink
+* ../netlink/specs/index
+* gen_stats
+* gtp
+* ila
+* ioam6-sysctl
+* iou-zcrx
+* ip_dynaddr
+* ipsec
+* ip-sysctl
+* ipvlan
+* ipvs-sysctl
+* kcm
+* l2tp
+* lapb-module
+* mac80211-injection
+* mctp
+* mpls-sysctl
+* mptcp
+* multiqueue
+* multi-pf-netdev
+* net_cachelines/index
+* netconsole
+* netdev-features
+* netdevices
+* netfilter-sysctl
+* nexthop-group-resilient
+* nf_conntrack-sysctl
+* nf_flowtable
+* oa-tc6-framework
+* openvswitch
+* operstates
+* packet_mmap
+* phonet
+* phy-link-topology
+* phy-port
+* pktgen
+* plip
+* ppp_generic
+* proc_net_tcp
+* pse-pd/index
+* psp
+* radiotap-headers
+* rds
+* regulatory
+* representors
+* rxrpc
+* sctp
+* seg6-sysctl
+* skbuff
+* smc-sysctl
+* statistics
+* strparser
+* switchdev
+* sysfs-tagging
+* tc-actions-env-rules
+* tc-queue-filters
+* tcp_ao
+* tcp-thin
+* tipc
+* tproxy
+* tuntap
+* udplite
+* vrf
+* x25
+* x25-iface
+* xdp-rx-metadata
+* xsk-tx-metadata
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/networking/xfrm/index.rst b/Documentation/translations/zh_CN/networking/xfrm/index.rst
new file mode 100644
index 000000000000..b366c908eb25
--- /dev/null
+++ b/Documentation/translations/zh_CN/networking/xfrm/index.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+
+=========
+XFRM 框架
+=========
+
+.. toctree::
+   :maxdepth: 2
+
+   xfrm_proc
+
+Todolist：
+
+* xfrm_device
+* xfrm_migrate_state
+* xfrm_sync
+* xfrm_sysctl
diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
similarity index 96%
rename from Documentation/translations/zh_CN/networking/xfrm_proc.rst
rename to Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
index a2ae86c44707..eb4ece66df49 100644
--- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
+++ b/Documentation/translations/zh_CN/networking/xfrm/xfrm_proc.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/networking/xfrm_proc.rst
+.. include:: ../../disclaimer-zh_CN.rst
 
 :翻译:
 
-- 
2.51.0

