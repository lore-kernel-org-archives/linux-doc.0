Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB83EC2F3
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846212; cv=none; b=PUC5M0t7cKucgavIGpjCzeW5rw0XMcXseFo+mDL1TAYbUWApvdmRtOXEzBpT7D5JAqj6nry7hSj0n2QEe5ChQqno6BzTENwuOWz3n2iBbw3r3ZV7G/xBTu0ZMEmmFIoEiv449GqgrnGzEePSlvrQFDWu0D1YZzXeH5yx0L1p++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846212; c=relaxed/simple;
	bh=sVd8LTVEHoLKFD1aY4N3BnWCDAMnZxFR8UMGpqAS4sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIOa/zbu1PertoERrynet22y+gae6B8ppOSkibnxDaHljT4MQQ7ncgVumgSrcnTS5rwitB4m0y9MSe6edQe0hglvfyZStjNKIRBEDTTWhkukAm9P2ry8X6XOjiMIXW7qnatPhexulgKJzXJVtMbZ+V8OOWs/OVDmJsPq1fMOLWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so5425488eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846207; x=1774451007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S2Eshwmt0Yi5gowTBPApYQhLiCclUhxDbq8BJfNjYyM=;
        b=n/seyr9GuU1oKNBnU+ARRIoSSHyHBzHlAo1gNYah4hDVKxYNm0xqTxDg39DIsgrxuW
         kgk8tyCQvCQpkxYjbVfQrS6rRMDbJd865Rc+QygfEIqWLfBvGwWiNuClTmvnz22QKAqd
         jpLRm1fDTeRtsFMzMn+YvvGF0d6kzdIlUYSqyuydj50NTcpDR3YB7IDzOVcBkKJWd4RZ
         IQJDbl1FkcvU1SVjlRLmp6LgjeruQFknYmt/1zWRBQKHW5b8GiOIb2C6fppOQId19J/M
         UIj5pBB8FEYiLFTeR41K9f8aa3rHNGWrRbFUrCGGcCbNOlST+Vgt3QLL34Ai9ruGw8Mr
         KxFA==
X-Forwarded-Encrypted: i=1; AJvYcCXUR+J4TqlHqlDIxL57eUxWiMsGHJ5KPipyESt3lRdcP6bbqOpvPGWCevVFKxzVVoxJ4gdCzbGQONQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqaWpAvfIRhnxx4Fcfs+k9Cu9QsRlZpUYNTzgKt9Plhhf4+VfX
	H/YguYx2GprDa4wpqG3XJliJWHO8cYOTMY6JNvxOwfWrOKgLu9D51Gk=
X-Gm-Gg: ATEYQzwJeaI6KqiXDqrRV19mPrK/FZXh68OwuJRiUJntlhzRm0QxJ26XVrud/OJBYwt
	BTD1w4XzgxufmYgE8fBBLPBHvhFqpcGVAO+fl5q4aHiY7N5ajbKlV18+3vIKl/SqDpfjoRlwOQa
	09eSb0Nsw+jBVnI+UAifzdqLBIGaHFGdKyHekQEgGUUMx6eycDeoJjqQvMz+nNZXOm7Y9IZ8kKX
	uU9Aoq5RXFub5TePmMKR30I5Ys8ImF4fxusjuQakb2dLjpie0axpTT9lRe50n/dTKJxp5bLXYk5
	hHLwXLOojbeuziNhapKnWbBGaQurROsHUug/NVV/x1ZaTiTvYL9SMzfY4uxREX6WAfa1L1KPZsm
	Es4AvarEAc9i0u+3a5xfecxI3K6D0F0oT8tEfcg3L0TyA3aw9siN99N6PAzppseDVoCGLTtXo85
	AsLA3CGi/f7kuRUFHio78Qnp+7+2iOOgsSJTUtw+eB5NOu2VjdHDPhx0qIr0P6PeEyH0UFPp1lS
	QkAx/HI3KeOwB1MwQ==
X-Received: by 2002:a05:7300:fb97:b0:2ba:a3f2:958c with SMTP id 5a478bee46e88-2c0e4dc3156mr1648308eec.0.1773846207075;
        Wed, 18 Mar 2026 08:03:27 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55cd9cfsm3997754eec.26.2026.03.18.08.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:26 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 12/13] net: warn ops-locked drivers still using ndo_set_rx_mode
Date: Wed, 18 Mar 2026 08:03:04 -0700
Message-ID: <20260318150305.123900-13-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all in-tree ops-locked drivers have been converted to
ndo_set_rx_mode_async, add a warning in register_netdevice to catch
any remaining or newly added drivers that use ndo_set_rx_mode with
ops locking. This ensures future driver authors are guided toward
the async path.

Also route ops-locked devices through dev_rx_mode_work even if they
lack rx_mode NDOs, to ensure netdev_ops_assert_locked() does not fire
on the legacy path where only RTNL is held.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/dev.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d50d6dc6ac1f..187cd7b5074f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9778,7 +9778,8 @@ void __dev_set_rx_mode(struct net_device *dev)
 	if (!netif_up_and_present(dev))
 		return;
 
-	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags) {
+	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags ||
+	    netdev_need_ops_lock(dev)) {
 		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
 	}
@@ -11470,6 +11471,11 @@ int register_netdevice(struct net_device *dev)
 		goto err_uninit;
 	}
 
+	if (netdev_need_ops_lock(dev) &&
+	    dev->netdev_ops->ndo_set_rx_mode &&
+	    !dev->netdev_ops->ndo_set_rx_mode_async)
+		netdev_WARN(dev, "ops-locked drivers should use ndo_set_rx_mode_async\n");
+
 	ret = netdev_do_alloc_pcpu_stats(dev);
 	if (ret)
 		goto err_uninit;
-- 
2.53.0

