Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A4470E84
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134208; cv=none; b=Oi1LM1afCh9kw4QvoZY6QQQWjz/yk615b3cq4mqs9Vwjg2f/jThFaUkFxv1Nr4NBYYkOSaFxZxp7Wy/a6TmBVqnY6ZCMuxakKuc7W2JLMYL02aHCUIjo0N1XZaByRyWOUoTUan3M3fxuKBiBVcrwQDYh/sxZOSECAeWvRpYtnyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134208; c=relaxed/simple;
	bh=h0fforI9/m/s0XSTv3gjhYlQx5oeqaJ+LYwUPqRIv18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLLmfBh+/u3ZrYlYzM7mBIBOcoDKoXeCJPiHOnmN9z11+aro4KBFZG4I1NTaMyvmv8BWf0sBvKTLMI8VpLikx1/LFnCfY3Sm7TaKFRYLl1vWsIz2FWik1W9X4FgC7JAnPyrJkmxAXypBCzKkhm7WPQgKeDyfpHh0c/a9ICCe5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=OV8orMGt; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="OV8orMGt"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae42b3e901so592890a12.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134202; x=1791739002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5uUcI1/RkV6pA20Ka1TbaV7lMFxccYVTKU3RyjDpPg=;
        b=OV8orMGtxEiRmqR7Gz3qQluEHMA+J1kKi3NSH6SNP9Rxo+NQEA0UWlEDklodBJUneA
         4mx52R2kQ0AZWJiODvKxZazNdlfbjEoP3wQJOO1ZBfIjmte0GrSK8MQ+6SXnQnWD4Bwd
         CnjOvdxIxAfMz/55dhhQ5VM7J0AiNlQlcjnWfS7SnqOsVu8zSdx2f4nF1QU6QTORtNHY
         XXzgrv49yAW6TafSGuqozIloa0OD10mQQkZE6VbRqdndEXYGjTUBLlzNiWKCs+Q1FZSE
         6zfFHH+DFX12Ysg5Cp5wXv0IsaSEadiY7uxDuaLvQa3IqGDR08ZwVusT999gHkps2Nws
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134202; x=1791739002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5uUcI1/RkV6pA20Ka1TbaV7lMFxccYVTKU3RyjDpPg=;
        b=RbFDkMvcQhHYYcne/mZtZYQcX90dHNXoSLy50BPE4TI9kCbfU1W0JPg4g5OIlqsR3r
         SdBW0QT8CWFhgvSxP89Qixot59rOMEiMwsckSNivauJS7PsNYsvgQZRmt45+RG1eFgxq
         GZerRsw33AY5AEcfqYxsnoAlRjWg6btDkqgtTT81tvRjvwQtFTcZlYt90Do1IWbKRSH7
         xZfw03dkk7ZMu5b30UngbYmfYHTE0+Jv/LhGXWGOCZDvmhLstNLgExeWKriBRTgpYhh0
         gUExXUgJ7hnXtOwZKhnBmwumRFTIuQrgmBVMTEPDtBBwjHOQ6yLIRtiJ3qcqrNEk5SEE
         9Gug==
X-Forwarded-Encrypted: i=1; AKwUvBwzjvUXDHGUM1kf0WyS2Xlw4Grt8vVaP8GfFAKBBOJ61FXj8IJ4VNXuh9GaDRItBKHRsxJ0bkBzE58=@vger.kernel.org
X-Gm-Message-State: AFq9FYL01K0WbzdFQs19e92BP0X/5Zqz3izIG9iHhLwRgPTwGdT+11zq
	lVfCWGYGiGvaBOHSrceejFK2ZR+YPdG75WL4plVMlQP5DhauNErublMJqFaYu+Z6gg==
X-Gm-Gg: AYBFou0rIWZMZDBVwjzlWb95qIXkGAFW8ELB23KTGqh3Urz14kD6yIj5KrzIHFvH0YM
	wEsD9tfEDBqWrYWjelhuBJIKtqHQG+eYD/g7eS5OKnAL6MMi8VloG4+JiVJlFAfgNhg0TBU1Ohj
	aVWWiY2dDKt8HXQAYQxH7VP0n8rMUPeiyCtcitwiyTq03d8WmY8my8/O3M2EP7O3dvDJXszSKpm
	QP1pBS7f3X3nr8SRN/yVduSNCEdWjOTpkbUXZRgTtwM/n9CLmwJpumKit4PgX+dn3nc1Pv62JQ/
	nCA58M3HKQLuun+9+0e5U6tSSreWOri3RPn9zEm8q+y6ELZ1TRRvxOhC2pO08flGY+mWa3D0+Og
	Ewt9UcuGUEH+HJyJJZCUkOQ0wlxptSs984m9h4qH44r5D/Cp92/5rbs2tlWHRGHYOoe7Wg9K5qq
	NYeA0xKCKneudnf0OoMAXLbmd+bfdEBieNf92o4iFb4kJWajxybmBp02LEIkL1sjN2AW7QFYLIP
	STBCl5xLgwBJmg5Kt79CUrY/puUA5X4eoVIfM62+NMShZfof0b2hMdcaDrE+pRTBKZiWf5Lg081
	g/aEEW3Oh2q65HZOH3kAZAVjpF2EEMvLpWCvDARnjWwcNGKE4RwiET2t0s3Kppr54lsJCg/jRoU
	T+GJLp92O/EL2vSqp2kI4FUy4w2nYw9f4PDC1QQfCwHv043i6NPhW1MB0Fr6cUwevWsy2BfF9Tc
	czhgb+m0X+bcKn6edqVS4VjczMOnIq9Ee88Q==
X-Received: by 2002:a05:6402:27c9:b0:6aa:e251:ecb4 with SMTP id 4fb4d7f45d1cf-6af9e0468eamr6985282a12.2.1791134202135;
        Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org,
	fw@strlen.de
Cc: phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v3 2/3] netfilter: flowtable: carry a priority into the offload
Date: Sun,  4 Oct 2026 19:16:35 +0200
Message-ID: <20261004171636.3545085-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004171636.3545085-1-julius@bairaktaris.de>
References: <20261004171636.3545085-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Packets forwarded by the flowtable skip the ruleset, so a priority set
by "meta priority set" before "flow add" only applies to the first
packets of a connection, and drivers never see it.

Store skb->priority of the packet that creates the flow, apply it in
the software fast path and emit it as FLOW_ACTION_PRIORITY, the action
act_skbedit uses. Flows without a priority are unchanged. On IPv4,
ip_forward() derives a priority from the TOS by default, so a flow can
carry one without a rule. The priority applies to both directions.

airoha uses it as the QoS queue of flows that leave through a GDM port,
as its software path does, mtk ignores it like FLOW_ACTION_CSUM, and
mlx5 ignores it on flowtable flows (previous patch). airoha and mtk
parse tc flower rules in the same function, so they now also accept
skbedit priority there.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 Documentation/networking/nf_flowtable.rst       |  4 +++-
 drivers/net/ethernet/airoha/airoha_ppe.c        |  3 +++
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
 include/net/netfilter/nf_flow_table.h           |  1 +
 net/netfilter/nf_flow_table_ip.c                |  6 ++++++
 net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
 net/netfilter/nft_flow_offload.c                |  2 ++
 7 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/nf_flowtable.rst b/Documentation/networking/nf_flowtable.rst
index d757c21c10f2..5844ab19aec6 100644
--- a/Documentation/networking/nf_flowtable.rst
+++ b/Documentation/networking/nf_flowtable.rst
@@ -71,7 +71,9 @@ forwarding path including the Netfilter hooks and the flowtable fastpath bypass.
 
 The flowtable entry also stores the NAT configuration, so all packets are
 mangled according to the NAT policy that is specified from the classic IP
-forwarding path. The TTL is decremented before calling neigh_xmit(). Fragmented
+forwarding path. The TTL is decremented before calling neigh_xmit(). The flow
+also stores the priority of the packet that created it, so a priority set before
+``flow add`` applies to the packets that the flowtable forwards. Fragmented
 traffic is passed up to follow the classic IP forwarding path given that the
 transport header is missing, in this case, flowtable lookups are not possible.
 TCP RST and FIN packets are also passed up to the classic IP forwarding path to
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..e790305ea955 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,9 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
+			priority = act->priority;
+			break;
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 99b28aaa7cc4..4ee99e8e4a34 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..23218c8cbc3d 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -202,6 +202,7 @@ struct flow_offload {
 	unsigned long				flags;
 	u16					type;
 	u32					timeout;
+	u32					priority;
 	struct rcu_head				rcu_head;
 };
 
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index c8c29a9a1684..c85e2d608c32 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -509,6 +509,9 @@ static int nf_flow_offload_forward(struct nf_flowtable_ctx *ctx,
 	ip_decrease_ttl(iph);
 	skb_clear_tstamp(skb);
 
+	if (flow->priority)
+		skb->priority = flow->priority;
+
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
@@ -1104,6 +1107,9 @@ static int nf_flow_offload_ipv6_forward(struct nf_flowtable_ctx *ctx,
 	ip6h->hop_limit--;
 	skb_clear_tstamp(skb);
 
+	if (flow->priority)
+		skb->priority = flow->priority;
+
 	if (flow_table->flags & NF_FLOWTABLE_COUNTER)
 		nf_ct_acct_update(flow->ct, tuplehash->tuple.dir, skb->len);
 
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 801a3dd9ceea..caaadffc2563 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
 		return -1;
 
+	if (flow->priority) {
+		struct flow_action_entry *entry;
+
+		entry = flow_action_entry_next(flow_rule);
+		if (!entry)
+			return -1;
+
+		entry->id = FLOW_ACTION_PRIORITY;
+		entry->priority = flow->priority;
+	}
+
 	tuple = &flow->tuplehash[dir].tuple;
 
 	for (i = 0; i < tuple->encap_num; i++) {
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 32b4281038dd..c8eaf7bc356d 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,8 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
+	flow->priority = pkt->skb->priority;
+
 	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)
-- 
2.53.0

