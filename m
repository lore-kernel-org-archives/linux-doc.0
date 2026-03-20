Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED83019DC
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969921; cv=none; b=gjgwjsK40wcuPRlTt7uIYjUexWgL1FRBRhk13n0GdmJUcEbYbesQc89nyiww2w06fvNKxfHSuvFwqIGcS/hYnE/JABxsqG4p6nm/ivUX9cxQ7cAZV1ytNruCVpcLXgfMFCTb1TWEeVt1EpxL//5qOYFab45yqwjCa20M8D8GdDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969921; c=relaxed/simple;
	bh=VK90M3+EGSzjVfsemFKOmNIILll+ZAdpTFJtqe6Y2Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu33Xj9xTvy/nD32dVfSNDwrDM1jnKeJmYNvikgldCbbW8paBDxf5MbhBTb7FTZq7wiUQKHU1UMXEwJtHoyOYY5D6K/CJebIVGFsZHfmlT50RGzSk8IYwzrOxT+Zl8ihfWu8tS/P0DHEIQSx03VuDuAddy5gswEJlpLm+EddQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12732e6a123so2875123c88.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969918; x=1774574718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWBQoO52uK1jdWWUCzjHOfQ7E5wdgkDdRoNSlPpZPUc=;
        b=XC6DKVUchsBTIFqE2dTWTf8PxAHe7rl04dR2drRA10QiXzvdkCGh6C6ssnp2pBg6zA
         1AQWmK5eNodQnaSZS+eZ3Dv+dHPCPjjStYwzsnrWcqL5b6DfGBth03qRcdCvBeKKdIQ5
         uupzJUKq9uPId4LMk4e8jf3qEcJXtORQF7qTWVLrf3zwaSh99/mP2v4FQYmidJ8La7LP
         TcAytECvncp6FEI7lMP3OCN09D47jIcWlS8x2ljsFoqdMSyBgnnsgJ0KnQppppiJVs0V
         LYeAPaL7EnsLQzluVP69TxLWWEyV/RP6Ld7M+CnATP9SUyHMEL8EwG9ljMO9QXeu9X/j
         AVpw==
X-Forwarded-Encrypted: i=1; AJvYcCVHompBbgG8lk1UV3ANpylcrAvcX3obv85pfCXNPuonh1lpzm04f32uemU4msWyXYbSm7bScXtm2FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8gZzoWmDBM1ABjcPl+8KV8CAucTFWX7WhzsCT9sHRrrb1513
	DqU5iJnR6HIyLBOl2Bp6FhwEbD8gBruV4CbJUgcQ5R3TMT28BySOZI0=
X-Gm-Gg: ATEYQzzoC0pfSuV7dNn0j4pqnAQnnPT+W73hLMcbejFkmus1a/dGMXQr6i97ApkVR7X
	lsBi9Acn//JKr2bxgF4gqarwsBIiTVznAVB+HqcJo/OzgXxbX/Xgz1dEMaormxbYmx7ECjCn3Na
	fEtb8igPtJjzddgAe/MrlKFdEjR9SigKzVSypN2E3o99WjrmLk2kPNwJi5CmQggWq+Rtw7WtoGi
	z9U1Beop0TQVFHcrhqI326j+KJslWc4UHaGoBB5GSoN9IE0QTPoA+HxDuXV/cBVPJ/jtJdgpH37
	aEfMEWGUx1ed3KmylRd9w7FTSQPSQUUbRqJ/Qd1jGj6prPFo8bgv16tPjHCKkW5WHo1qXz6arHg
	teOa/skiftVHGH74hmDxfOYhD5QoZ5ZzP8i2Xfqv4tfu5DU30QUur5urfoCiGiP5+0qqHSj3cG6
	Yzkuk4ICbbGIbqbzyStXm8dZ0/+hEYrflkaX2QDYYjFbCtVlG/bZO06G7v5duub7cFbk9zb1hBq
	cBtQ06nQ5K6Zke1ig==
X-Received: by 2002:a05:7022:e08:b0:128:d737:d7a6 with SMTP id a92af1059eb24-12a7266cdddmr651698c88.3.1773969917836;
        Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bbbc5sm747251c88.11.2026.03.19.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:17 -0700 (PDT)
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
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 12/13] net: warn ops-locked drivers still using ndo_set_rx_mode
Date: Thu, 19 Mar 2026 18:25:00 -0700
Message-ID: <20260320012501.2033548-13-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
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
index fc5c9b14faa0..f38ab254708b 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9779,7 +9779,8 @@ void __dev_set_rx_mode(struct net_device *dev)
 	if (!netif_up_and_present(dev))
 		return;
 
-	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags) {
+	if (ops->ndo_set_rx_mode_async || ops->ndo_change_rx_flags ||
+	    netdev_need_ops_lock(dev)) {
 		queue_work(rx_mode_wq, &dev->rx_mode_work);
 		return;
 	}
@@ -11471,6 +11472,11 @@ int register_netdevice(struct net_device *dev)
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

