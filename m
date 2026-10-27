Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098169;
	b=fq0rpsClWiEj20WxFf/x4WGi2mKrk4hrbfiTMBXTwczsmK7cLHsWesvKucnSlpPhnkZa
	 l5RQH61u8pMp5K3hEohZY6jmN22PwUJLqBQi5B08AfxT0Wjui4uvZyzk9aAhMjrSDLR4Y
	 vbLLUaWanrXwnkZqx+837jnHXo8qBk3WzKP037mlgwjiiUc5VA084LUyZBch49RzGRO0h
	 bD4p9gczBuDN7Xe77ooCz3/oA0+YrXptxL9pUd0slT69ADWZScMgcSqCjaMzSqJLwo46p
	 bKwrHgX3zjeEYKOyR+ovy+02AFkf9P0C0y/jLTmJKtDeHswDCnWk9sHydBL2bd2o3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098169;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hP/wufYrzFLIuJAB9Y1+6Fe9O2Um3BU+tPM/w5XHFXA=;
	b=KmNrIzcHcrLshgAVRn7X+5dxeBZv/zH6NfjEp7kSrF+4XSA9vaquIG3LqKuacY8gXm7X
	 DcnDlFlwwKQlhIpGx0XwWG6X3eDGH9eENNpqUjUfjQVf02LYfSY0V6TLHV3WRTnbKxOzC
	 xqB/VWtMhJzLzMPhCI41hWpKy+DJw3GQmd2X4F2K4p1ruWltl7TPvsPLaFeGBPle98KrI
	 CJR2nrK7fU188GRh3O717E9+KavgyRRuUZdQJobAgA4k6xHJ14qFlrVJeNHgVfV/a56eE
	 bovX9Y/x9ACSW7Ovvnuw5lxiqkke1Gc6iOK7m2yZ9hoaAQoJAJkTGEyYB+1EBSZj5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="ur/xEiLp";
	arc=none smtp.remote-ip=95.215.58.19
Received: from mta1.migadu.com (out-19.mta1.migadu.com [95.215.58.19])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0400F606A320
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0400F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ur/xEiLp
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+jgyQbXsrKaLn9nkl/YpTRZhwiLrtYdg6s8W7kdR5tM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793098167; v=1; x=1793702967;
 b=ur/xEiLp9WuEEAWfqQKLr95rRnCdEtm3ytBCE+JN2/8kdP4me4QQddfMJfK8CmaE/ks4q1Eh
 SelV97I7o3DLfSwZh3QLiffTEyw+Rc6B3gJl55N/9N78DUp2Sda/pVgYuWuMiSf3XOY8rG2gh6r
 qs3Pd3DaKBC5q6dlsw897D8A=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b499b9d68ef21faa;
	Tue, 27 Oct 2026 10:49:26 +0000
X-Mizu-Trace-ID: b499b9d68ef21faa
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	stable@vger.kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Maoyi Xie <maoyi.xie@ntu.edu.sg>,
	Daniel J Blueman <daniel@quora.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Flavio Leitner <fbl@redhat.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Petr Mladek <pmladek@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/5] ipv4: restrict igmp_qrv to 255
Date: Tue, 27 Oct 2026 18:45:32 +0800
Message-ID: <20261027104701.296240-5-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104701.296240-1-jiayuan.chen@linux.dev>
References: <20261027104701.296240-1-jiayuan.chen@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

net.ipv4.igmp_qrv only has a lower bound, but ip_mc_reset() stores it
into the u8 in_device::mr_qrv, and the IGMPv3 retransmit counters filled
from it (crcount, sf_crcount) are u8 as well. Anything above 255
silently wraps. With 256, mr_qrv becomes 0, every
"in_dev->mr_qrv ?: sysctl_igmp_qrv" falls back to 256, which truncates
to 0 again in crcount, and igmpv3_send_cr() never puts the state change
records for the group into a report. The older version querier present
timeout (mr_qrv * mr_qi + mr_qri) also collapses to just mr_qri.

Make the sysctl a u8 like mr_qrv and switch to proc_dou8vec_minmax(),
which rejects anything above 255, and document it.

Fixes: a9fe8e29945d ("ipv4: implement igmp_qrv sysctl to tune igmp robustness variable")
Cc: stable@vger.kernel.org
Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
For AI review: drivers/net/amt.c writing sysctl_igmp_qrv into the 3-bit
qrv wire fields is pre-existing and out of scope for this patch.

v2: switched to u8 and proc_dou8vec_minmax(), as suggested by Kuniyuki
Iwashima.
---
 Documentation/networking/ip-sysctl.rst                        | 2 ++
 Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst | 2 +-
 include/net/netns/ipv4.h                                      | 2 +-
 net/ipv4/sysctl_net_ipv4.c                                    | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 71f334f27004e..9e282fb046904 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1906,6 +1906,8 @@ igmp_qrv - INTEGER
 
 	Minimum: 1 (as specified by RFC6636 4.5)
 
+	Maximum: 255
+
 force_igmp_version - INTEGER
 	- 0 - (default) No enforcement of a IGMP version, IGMPv1/v2 fallback
 	  allowed. Will back to IGMPv3 mode again if all IGMPv1/v2 Querier
diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
index 3dc03bff739e4..2833ce6cba1d4 100644
--- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
+++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
@@ -143,9 +143,9 @@ int                             sysctl_udp_rmem_min
 u8                              sysctl_fib_notify_on_flag_change
 u8                              sysctl_udp_l3mdev_accept
 u8                              sysctl_igmp_llm_reports
+u8                              sysctl_igmp_qrv
 int                             sysctl_igmp_max_memberships
 int                             sysctl_igmp_max_msf
-int                             sysctl_igmp_qrv
 struct_ping_group_range         ping_group_range
 atomic_t                        dev_addr_genid
 unsigned_int                    sysctl_udp_child_hash_entries
diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
index cb7f8bf15671c..3efbc7f4b4f7d 100644
--- a/include/net/netns/ipv4.h
+++ b/include/net/netns/ipv4.h
@@ -258,9 +258,9 @@ struct netns_ipv4 {
 #endif
 
 	u8 sysctl_igmp_llm_reports;
+	u8 sysctl_igmp_qrv;
 	int sysctl_igmp_max_memberships;
 	int sysctl_igmp_max_msf;
-	int sysctl_igmp_qrv;
 
 	struct ping_group_range ping_group_range;
 	u16			ping_port_rover;
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index e3760daa34706..09f7fc6771456 100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -975,9 +975,9 @@ static const struct ctl_table ipv4_net_table[] = {
 	{
 		.procname	= "igmp_qrv",
 		.data		= &init_net.ipv4.sysctl_igmp_qrv,
-		.maxlen		= sizeof(int),
+		.maxlen		= sizeof(u8),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
+		.proc_handler	= proc_dou8vec_minmax,
 		.extra1		= SYSCTL_ONE
 	},
 #endif
-- 
2.43.0

