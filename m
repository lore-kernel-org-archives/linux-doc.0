Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DB357D19
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132152; cv=none; b=HzPdO7uCKdXTu7JpXgZeuFYbNouvx6N0vvV0IaahJmg7D40F1VvnT2IZBEPizeoBOyvwQ8O/Tj++9iXovlG/a2VKm4EiZQ8vGA+vvZM9PuxUaki1YdkZP8pcrYskRNW369B5d5QNgHjkF6e/nABRPZ+62BEt9xxlvUqUUdv+9tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132152; c=relaxed/simple;
	bh=i2wCKpYfmJRZYMcu671/cz07L/pWSr8Quj12tbY6/lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/fK5eLUwg1lNeJAMP5Kli0jCq+P84FLhIWSfPc3HSbu07TmjuNC+hZI4y6yUeDmAM0IHxTFhlxnJCIyx2flBAeEnJ97I9JcMPnPN1QpQ+xH1SI3dxL8RkfR2GrAuElGd6pAkdpRMUorep709nfAV0s6MjigWL580MzUrjUm2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGACnzyh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGACnzyh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-855de2d0d4dso33183247b3.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132149; x=1788736949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1d2o7Bv+elIT7N1ffI/14l1K9kWTm1+Hxafq5ZWY3U=;
        b=QGACnzyhRC4A5f+CZiaBYXIL8g5FZJyveQSty0Aps5wF6F4MbxkyQHWuaOCp6LVCcy
         J8Rwu/wY4eK7JfUeaa70ImGYWVLeshiAis1DdIfvnvzGcAK5MqbqMkVnURh94ySlkgCD
         JC/wJ9KAAtRziRAIRCIE3Yxk7jZwuMKnRxuyobiCS9yu1txof4MHtoVknYf1Mh/YxSKo
         aCViUvdhKq5v1I5Y6Z+Uk/90MtvZT9YmloAzIGbDVSg30vehilEgJwc0WS3oB2ozdNqq
         Tsh3mrjGMP2sUtUyHN8R4FIfnle0vPFeScrm5r0aBYSFwmHN1CFN0i+t9y1RdOpSEiar
         jbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132149; x=1788736949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1d2o7Bv+elIT7N1ffI/14l1K9kWTm1+Hxafq5ZWY3U=;
        b=aLoiWy8XvcxbSwKZW+mn7YIVBovUd4hYRh4ebPWVgg+pLrWMlbrVKdmNb+OFUo9CY0
         lQnIznxYscZK3rKNB7X39D1MrkhW++HVFsRTZ51ZVsH+wnaWiG/OayIBbimLoIafO5ZV
         hiuW9htkH8xQhkLPWnTJrhMO5Yo1rb8fJlXEX8aVhkcA4uAJqHiY+nBZpez69U3r4lcN
         eb3cAld8TsLCFMPj1f4bKuypFv8mkg0mwIj86JajKSTeh+pIxH7rVAjt0yckiRwmKSNY
         NuTUYwC5gzhHAhh+DsorTc32hsdRIarm6a6fLW3qtF6jmYcGMVSRBzfKA2gHbvcet6QD
         lUzw==
X-Forwarded-Encrypted: i=1; AKwUvBxbiJKB18wwhhhBFXBt6RW7X9kgnb/j4PGbewWwNMqNKRrX4B3fDEUfEOsyoSKMYXcDTL5+hK83+xM=@vger.kernel.org
X-Gm-Message-State: AFuF++kdyel/VB1fNAKHOy37qIJ3Q5tZRNzL80atji/oeG8U4U5FAdID
	5kDtpFhVtkNfuAa5JVWRfCpRFuY099WLvNL4PLhAVd8Xx7ShjcIpJf7e
X-Gm-Gg: AYBFou2pwDu23OLtx/p7AHfXvBIP8Ag2bZemBOr+GRqFp9xlmpEzSq3dAlSaLtIAfdQ
	N53/+foyewuk6geKOUBcI64GFBmBLdLHMkiswmwgvuUdHszDvLwOFCJ5hXHw6wtx1da5UxVqvQp
	2cJRKe/jHFNlBo/Jm+qoDgLN0f2AA0bD6kQKNjS+yO9T/QwU5dsoWJNNcQyoKiLvRcEPT+Jew2V
	KXqP4CWFwweD2/FVVwyQl9ltzUuQiDTI8W0S1pa+/YppFn/+4saifVQe+h8XAKJT4sMkxnTNGS1
	3w+NIOGmhUj5FVUSPWIlqK84CkO4Az8wvyA5NNEFIgC7y8MRNbYRKivlg3GYLJVaF70EXGJTgyj
	DDEqOxcPf2U6KKeCWMMTZMdNQup77wRDGXjiqaWhEDhr4eRZ+9S6hmDlJ/ebWKlBIAzxVt866vY
	zjRflFHOoGns5otrakk+nSmilWIpPY7gQeKFfA7f+/lw==
X-Received: by 2002:a05:690c:e3ca:b0:858:bf8e:d0a4 with SMTP id 00721157ae682-864f634fffbmr13982757b3.18.1788132148676;
        Sun, 30 Aug 2026 16:22:28 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:28 -0700 (PDT)
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
	Matt Vollrath <tactii@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH iwl-next 3/8] e1000e: prevent race between PM and reset task
Date: Sun, 30 Aug 2026 19:21:41 -0400
Message-ID: <20260830232146.36948-4-tactii@gmail.com>
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

e1000e_down could be entered simultaneously by the reset task and the
runtime PM suspend callback. Prevent this by acquiring a runtime PM
reference in the reset task.

The intention is that:
* A reset attempted during runtime suspend should drop silently; the
  interface is already going down.
* A runtime suspend attempted during a reset will be retried later.
* All callers of e1000e_down are now serialized.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Fixes: 23606cf5d119 ("e1000e / PCI / PM: Add basic runtime PM support (rev. 4)")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 25 ++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 47ff3c6ab451..4c15ca307b08 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -6004,20 +6004,37 @@ static void e1000_tx_timeout(struct net_device *netdev, unsigned int __always_un
 static void e1000_reset_task(struct work_struct *work)
 {
 	struct e1000_adapter *adapter;
+	struct device *dev;
+	int rc;
+
 	adapter = container_of(work, struct e1000_adapter, reset_task);
+	dev = &adapter->pdev->dev;
 
 	rtnl_lock();
+
+	/* Runtime suspend downs the device without holding rtnl.  Hold a
+	 * runtime PM reference so it cannot start underneath the reset, and
+	 * skip the reset if the device is already suspending or suspended:
+	 * resuming resets the hardware anyway.
+	 */
+	rc = pm_runtime_get_if_active(dev);
+	if (!rc)
+		goto out_unlock;
+
 	/* don't run the task if already down */
-	if (test_bit(__E1000_DOWN, &adapter->state)) {
-		rtnl_unlock();
-		return;
-	}
+	if (test_bit(__E1000_DOWN, &adapter->state))
+		goto out_put;
 
 	if (!(adapter->flags & FLAG_RESTART_NOW)) {
 		e1000e_dump(adapter);
 		e_err("Reset adapter unexpectedly\n");
 	}
 	e1000e_reinit_locked(adapter);
+
+out_put:
+	if (rc > 0)
+		pm_runtime_put(dev);
+out_unlock:
 	rtnl_unlock();
 }
 
-- 
2.43.0

