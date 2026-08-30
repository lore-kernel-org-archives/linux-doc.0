Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F635C696
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 23:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132164; cv=none; b=WHRJ6idVfE37s0XBdrcWSZih9fK8+H1MKxGaTWeJd66BbIc8a5vayn6x3JSDXzTbMfBIRcRtyY1VJzsa7j50Deti/1E6N5U/zwrNmxvHEgwXYP9+N34YWztVYAoM3p61m07CqBhTxPAl5XcH+BRZADQou/nfTJb3tl9uk3+hOeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132164; c=relaxed/simple;
	bh=ldiZ/+7239M5gwa7J+DQkVJm3fO1y4M0nP2v9KbMz50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZjLGPzCjAzxsoJhof+iFtW0Bt6CrZ1G48s3PDW2QiVraJBjeDW5JFJ32yjZYDaIRcKlx0bfFCUxUDI64oL6t8Ppd4oDMHP1Qjxj1Ha8ypc0IC5/jsdg9PnXBDRrTjHsfKqa8o71nXfCboK7C/uOeZChfN+u8ljFdHhFOkqdr0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlQfhAUI; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlQfhAUI"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836cb2fa1bcso24898647b3.1
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132161; x=1788736961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiW+JJ76BaAeq9W86nvcOxiyWOdlbAiuuIswuaS2d+Q=;
        b=BlQfhAUIx0/9AYTI5b4GrEJAX7xlc/cPlQbF0ikcqt81g+ubRzESCTEubIaTvnLRJI
         KBxzy6Rn7mw4WI+jSnSzJwnUIP1qAB1ZtswWaBNFd7Kninev/rtuRpJR7KWnX40gDmoA
         e22UK0SG/jb2hZxaH7feALEbKyy61usEYXtYtx19sF2lVQt/xpcPAEzisGIS5VE6tAWh
         uyN1QzW+IxApSv+cw/yhTGDHvXHv89jumJGUY22/h9PkGjB6bzyT1wJccw2PpAnPg//L
         koZ6oBv0PY2U6n4ANeteD6S+jNUUbkOmDnCuuTAPQ7i3ZcsyN8Ds7eKC2jPmMFwAPxbH
         BhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132161; x=1788736961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiW+JJ76BaAeq9W86nvcOxiyWOdlbAiuuIswuaS2d+Q=;
        b=neXVRzQEZ+vfScj72s8VF2m9iL2tmkNq5vfwltz1CnLDFcax/CI+KgkjhjVUVWn+q5
         FMFWupXMJCAQDmj5R2iAlC21rfDRIaJEZyLlSLsgD6Rax1txO137PnlcwoemvkeDV8UB
         m3rtIUpBSofGVgC4FeN/hFtXdjqEl4K3b2LUAVDKqYu4AR3PqvMk1ZWM/TeKcvaI6cwh
         iAMWwRNHcG1LZml9R3cXiJShk4qm71vZO+2lwT3P5uuVr3I2FWSy8q5BzmVzJLruqy2x
         bE2F/AGJjz29CjU5zXJYMYpgTsRy++6QET/xD02xWkujcrSUsQplcHquZ8W/fvrJVdWv
         OHgw==
X-Forwarded-Encrypted: i=1; AKwUvByAtjDQCtNIUgCVKLcpFkYXKD2y+Rlg0K90eOeOhVhiKj+P/fkMtzcBGPp1gV99hG949F1drVYZ0aA=@vger.kernel.org
X-Gm-Message-State: AFuF++kB/ooNGdQDZ5zHOc119Y3w80N67oMsuQZdHAdNzDjKIqaoA/1r
	8MzzTbwrOiNyzKKR7N4Hmoq0odUn8DVPu3m91hsPRFRvWucD+bdXFmxt
X-Gm-Gg: AYBFou1hRsNgaROqkbAnAYnj30F21AA+QBN2qyraSIeVrNIAi20WiVlf7vHE8mQiUEp
	RdHq+iY9Y6BNvdx6+esLu9wkBWUDdSmZkWBEcW1psAhJTQ98FhVMvwvCtjiE4dhyRZ7xT2fzjJe
	oIVdCsUXYCKYFqVVcnVkLVb/fwnBJM9tmmboCkOt8dRHseawJlXt/xA4pazdkfxea1fumeCyOxe
	oJglzEe2yKYbCjxbsE+vocAjSMVcLSdjW0rV6Wt0ZzzVYx4Ob91X5UATwRWq5fdYDvz0z4MAkjR
	MiFcejrsvCTF4Apr3FEVvBHM6e3HxgSV2DptgLfLXx2BFikUFxyd0HFcSyU2NSGnDBrx5TyhlvL
	tmqY5iEB0BmU4rW8T813ioVnILiREO9bVC2Lg3CU0iFgTPVw7aW+cUJ2yWZ1q8PGR4dYeX402/B
	S9hAGsP1/v/QrqVPh06l0IwMN+SRgo2ny5uhQKSeH9PvGlJi+tjXw=
X-Received: by 2002:a05:690c:30a:b0:80f:9998:e614 with SMTP id 00721157ae682-85d6eff6efamr86639137b3.28.1788132161448;
        Sun, 30 Aug 2026 16:22:41 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:41 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>
Subject: [PATCH iwl-next 6/8] e1000e: disable NAPI while interface is down
Date: Sun, 30 Aug 2026 19:21:44 -0400
Message-ID: <20260830232146.36948-7-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830232146.36948-1-tactii@gmail.com>
References: <20260830232146.36948-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The upcoming page pool conversion requires that NAPI is disabled during
reconfiguration windows. Otherwise pool destruction would fail the
assertion that NAPI will not race, causing a benign but loud warning.

Move napi_disable into e1000e_down and add a napi_enable to e1000e_up.
This follows convention of all other Intel drivers.

Because napi_disable would hang if called twice, all callers of
e1000e_down must now be serialized. As of this patch, I'm convinced this
is true.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 194166531bc8..6d846cacb026 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -3527,6 +3527,8 @@ void e1000e_up(struct e1000_adapter *adapter)
 	/* hardware has been reset, we need to reload some things */
 	e1000_configure(adapter);
 
+	napi_enable(&adapter->napi);
+
 	clear_bit(__E1000_DOWN, &adapter->state);
 
 	if (adapter->msix_entries)
@@ -3601,7 +3603,7 @@ void e1000e_down(struct e1000_adapter *adapter, bool reset)
 
 	e1000_irq_disable(adapter);
 
-	napi_synchronize(&adapter->napi);
+	napi_disable(&adapter->napi);
 
 	timer_delete_sync(&adapter->watchdog_timer);
 	timer_delete_sync(&adapter->phy_info_timer);
@@ -4055,7 +4057,6 @@ int e1000e_close(struct net_device *netdev)
 
 	netif_queue_set_napi(netdev, 0, NETDEV_QUEUE_TYPE_RX, NULL);
 	netif_queue_set_napi(netdev, 0, NETDEV_QUEUE_TYPE_TX, NULL);
-	napi_disable(&adapter->napi);
 
 	e1000e_free_tx_resources(adapter->tx_ring);
 	e1000e_free_rx_resources(adapter->rx_ring);
-- 
2.43.0

