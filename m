Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2BC471420
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134206; cv=none; b=KX5/eE09vIdHucVWK/aHNSaIudpCerXCrAnT/XKCyI7+mMNTiiZLwAufbkys93xwln5Bg29jZ64YnRuqycYyvAjPa4HtKKmXH6I1iqvscXAHXpPzAtOpYXpF+hYSHtAR5n8oySI2sV2fEgE/YB440dH5dMZ+A4x4YSotO4q9AbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134206; c=relaxed/simple;
	bh=nXd/4LFPlNEFAa0PUcYz+6AQtYlG+zgB4vefordwf/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hACsD3NMTRIqwLUfyeufEIyZ49JDQQccbCyjIjVExNQxor59wdliVNuelwQM77xv4447VT9UP6atZScn3kzaJQm12F9rO+a2Se8cJ/0jqUkpfbo/qZ5MeVBAu7xlgXkZ3Pw4YfMufoOym3yje9mMKZWsfMujlk3cMSlaH7pK0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=DswtWeql; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="DswtWeql"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so1313739a12.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791134200; x=1791739000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLYtPbQjZgcuVs2CGURwKTgeknAxIQmlp31jFys2sGU=;
        b=DswtWeqlhhaRjYDSnFlxmYoIL1ItD9tb4pm9l9TAY00Zmv3jmmlCQVvDTXg5805Ixj
         GgQIQvTeN5irSsyHpCvsPnYDMP0GFpzujovHF8ISuNRtEZhl+qDZYI0EzTjRCYY0FJe3
         11itbIg+ZDnArcUEfqme1OefcMlC7VR6rMnaT3iFlYXI+S9OlppROZRcfGe1n9itSZb3
         +cY2Kk1tA+0FqRv3PxJ2ioOkPEa0vTq/kdpP+eIKyL6Nin4MXYLyZy9cWuAjcKq2QKhq
         b5HZCTXouGYcopBpbEnNG/DR6+UZl9R1+md9IsJiD8Do4ycE0q5DlnXZwgEdcXLlon3f
         coeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134200; x=1791739000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLYtPbQjZgcuVs2CGURwKTgeknAxIQmlp31jFys2sGU=;
        b=fQTWy1VwZv7hkI/JhwVigg+W1sUqUlxwZQ6hxCF2D1VrW/QQ4oj3+z7B4HgzkxsMio
         zUpbXLDa6VhhHk9Yq0G+uCOS+ppNnyXuTe2B6PpnuvwlriRIaeFzflGxfBGZEnegapes
         3KAKLP9LizlhfnGPH7KjyJylyfRwQfoQ3sJFV+VI09vaLthTq7Gh5vRf8vctaqCPLZg+
         EBby6ds+8qO7/yNu46UliYtlWwnnDl5sfr94wo7KWsePY5A11tf9u5y03gTUfQRmYkZV
         sX3/QUpj4ecW/i0HUcN6JWQlC4AqV5p2BEJ5jkLo95SJL5FlXUVBqhImoYu4bKT4G8PY
         hgmA==
X-Forwarded-Encrypted: i=1; AKwUvByxcnmHjISBhymS/hgQzcQR30TyjWMsDxYDd+77Meox4NThxAUR/jrmBIuSRVhp1o7jxbPo/3qDFKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJc+01rMJ6sPBAw0tGX35UtNOAVfkgsj8V0jtDvNlmd27Q2/Ya
	4lrjP2G4WttoEij0b7SPNagw8vNhUy318AHDXY1BfpAeWh5IQ6t0pvzEfX30gjtLLA==
X-Gm-Gg: AYBFou10h2KnCQbmqFDNiOYjpaYQdwstKnhav5Yo2FwHPCu3oSHv+c1d7otSd8QOXgL
	AEkto7CFvpT5lH+EC8sZnItllry6j+lxf4VhXiWKdxKMfsUmv/UbOPuyvBVOL6FHW+R3SXknfZs
	nVpn8BNv1zd+slGwHusyAXlqGDCujIY7p0Z+tW+J/aK93LejIrZa8uJ1I9AsgmgtKzFtS0zj0b4
	jP2D0oGaetPcrYgXv6ZS858LWoipUF8bNEFMfMNOX8rrHPda9cBtBWebSIQ+qxRnGbhU4Eiv4os
	tZ/IyFEV8aU6/zfAz11vye3kipzaOxqzORC+YjQGWJ7EENj3d3wnjzTK/TxtMs5mPIzrLDtc8oH
	h7CiVKWIyouirSku8/xmqeP0W2yy9oB5yWqXs+GApgPQa8eSYZ66FA6XG99b3jkn61QF+BAv+UU
	Ok3w4DODX5UdextB91ZBstB7q8MePW6dd/YZhxGGsEDNco1poGwLggvlcYkH38jHaTlvCN4QW4g
	sy/niGRMxpVMvTYem29TjfFXClapA4M14gDW1St5Tw+GET8c8HZIo0SbE9y3ZIv/yMxOFYKkN0C
	ERYMgPN/jIHB54HHg9baSEm7PXqSlythta1EeMcLfeQSLvwC0Urr0aYDWoxZy3XfS2XFgS72JMW
	IkDd5GFRyIAnJ/RPvAA3Fsns+4A1Dg/kyoHZjWYQCjWtHP1MLRfpHMTfzoAjDtG1VpSHCeUu5w1
	FF+/mBZem+XTG/czOAXw6exE5J
X-Received: by 2002:a05:6402:3905:b0:6aa:e46b:2ca with SMTP id 4fb4d7f45d1cf-6af9e2fe4ddmr6623554a12.30.1791134200443;
        Sun, 04 Oct 2026 10:16:40 -0700 (PDT)
Received: from Desktop (pd9513667.dip0.t-ipconnect.de. [217.81.54.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb014784bsm2256819a12.3.2026.10.04.10.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:16:39 -0700 (PDT)
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
Subject: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun,  4 Oct 2026 19:16:34 +0200
Message-ID: <20261004171636.3545085-2-julius@bairaktaris.de>
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

The next patch makes the flowtable emit FLOW_ACTION_PRIORITY for flows
with a non-zero skb->priority, which on IPv4 includes the priority
ip_forward() derives from the TOS by default. mlx5 would reject these
rules and stop offloading flows it offloads today.

The eswitch does not use skb->priority for these flows, so accept the
action on flowtable flows and ignore it. tc flower rules with skbedit
priority are still rejected.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 .../net/ethernet/mellanox/mlx5/core/Makefile  |  2 +-
 .../mellanox/mlx5/core/en/tc/act/act.c        |  1 +
 .../mellanox/mlx5/core/en/tc/act/act.h        |  1 +
 .../mellanox/mlx5/core/en/tc/act/prio.c       | 22 +++++++++++++++++++
 4 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/Makefile
index 19e50f0d55af..8bd352e7f20d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/Makefile
+++ b/drivers/net/ethernet/mellanox/mlx5/core/Makefile
@@ -54,7 +54,7 @@ mlx5_core-$(CONFIG_MLX5_CLS_ACT)     += en/tc/act/act.o en/tc/act/drop.o en/tc/a
 					en/tc/act/accept.o en/tc/act/mark.o en/tc/act/goto.o \
 					en/tc/act/tun.o en/tc/act/csum.o en/tc/act/pedit.o \
 					en/tc/act/vlan.o en/tc/act/vlan_mangle.o en/tc/act/mpls.o \
-					en/tc/act/mirred.o en/tc/act/mirred_nic.o \
+					en/tc/act/mirred.o en/tc/act/mirred_nic.o en/tc/act/prio.o \
 					en/tc/act/ct.o en/tc/act/sample.o en/tc/act/ptype.o \
 					en/tc/act/redirect_ingress.o en/tc/act/police.o
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
index 0380a04c3691..91a3bab5e498 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.c
@@ -23,6 +23,7 @@ static struct mlx5e_tc_act *tc_acts_fdb[NUM_FLOW_ACTIONS] = {
 	[FLOW_ACTION_ADD] = &mlx5e_tc_act_pedit,
 	[FLOW_ACTION_CSUM] = &mlx5e_tc_act_csum,
 	[FLOW_ACTION_PTYPE] = &mlx5e_tc_act_ptype,
+	[FLOW_ACTION_PRIORITY] = &mlx5e_tc_act_prio,
 	[FLOW_ACTION_SAMPLE] = &mlx5e_tc_act_sample,
 	[FLOW_ACTION_POLICE] = &mlx5e_tc_act_police,
 	[FLOW_ACTION_CT] = &mlx5e_tc_act_ct,
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
index 2e528b2c34d6..bacbc862970e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/act.h
@@ -81,6 +81,7 @@ extern struct mlx5e_tc_act mlx5e_tc_act_goto;
 extern struct mlx5e_tc_act mlx5e_tc_act_tun_encap;
 extern struct mlx5e_tc_act mlx5e_tc_act_tun_decap;
 extern struct mlx5e_tc_act mlx5e_tc_act_csum;
+extern struct mlx5e_tc_act mlx5e_tc_act_prio;
 extern struct mlx5e_tc_act mlx5e_tc_act_pedit;
 extern struct mlx5e_tc_act mlx5e_tc_act_vlan;
 extern struct mlx5e_tc_act mlx5e_tc_act_vlan_mangle;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c
new file mode 100644
index 000000000000..2a047059574b
--- /dev/null
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/act/prio.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+
+#include "act.h"
+#include "en/tc_priv.h"
+
+static int
+tc_act_parse_prio(struct mlx5e_tc_act_parse_state *parse_state,
+		  const struct flow_action_entry *act,
+		  struct mlx5e_priv *priv,
+		  struct mlx5_flow_attr *attr)
+{
+	/* The eswitch does not apply skb->priority to flowtable flows. */
+	if (mlx5e_is_ft_flow(parse_state->flow))
+		return 0;
+
+	NL_SET_ERR_MSG_MOD(parse_state->extack, "skbedit priority is not supported");
+	return -EOPNOTSUPP;
+}
+
+struct mlx5e_tc_act mlx5e_tc_act_prio = {
+	.parse_action = tc_act_parse_prio,
+};
-- 
2.53.0

