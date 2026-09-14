Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6D3B19B5
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370168; cv=none; b=hxrKzfkDo8NzDmTnIePZaC2NIRl6PkDPuW0v/Ki6opW9/mJ4/WfZ+NEMeHgo/MpwZOH5PH41sdFKpuaaAgFCrueRMLU0DxiHlJJ3GeOVwC/15O4mCeIxbZYkkM+uCi/ricYlyj3CtyPdj5QFvpJ3hUh5ifUGvIv9Gei47KTs278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370168; c=relaxed/simple;
	bh=Z2lb95NyFj5VMsmWjYdqmvMmkWFzhfs0R05riKxv8DI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOO9EOP9x8r/RZvyhkPdJFmH9cicVeI/pUqO9hu8DuW+EE0mR6Y84ZiO+KXBQ247dwMo4TH6uFF+LOxGDmOu/flvgk92HTijJ8IXZjgFq053jek3gcg31dklsXXpC2oBIi/Es3cEsybSm8rBl5OsUYw/o9q9gOIlJ5yYAyN0OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyRugKS9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyRugKS9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso11444475e9.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370163; x=1789974963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYDvBl7Hf5spaenerJy9kw2Xhfgsi5OoXNIquuHbSV8=;
        b=EyRugKS9GCbkM5p6x9ZscNtVNToZLTaNyVuuaQR3fDtnmRBpYPwz3cnSx4txSSpL43
         lv0L7kV7mjwpfc8gq3x3k4GA3myUduSISe0qMXVwFF6RTyPIN874QDjQfFc+nGolw8IA
         tYhw6FBJhEv7UlW/j8/T19N68RLjTm9wyITvbEhd4CwGgyFIKSQFZe56ci1DCxX2uiM8
         OYQKqpPhMv2eWAALKhpgl4hKimtEGXLuXSH7gD1uVmn4NUV+GKOpm+oLjs+LF4RGtNbq
         Qxs3D7WeKHYmfqjjuaR5Uly17lO6ZnO627fCe1kz7qBw7pdBYmNvxp8pH6LlvxLYGSLP
         FWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370163; x=1789974963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYDvBl7Hf5spaenerJy9kw2Xhfgsi5OoXNIquuHbSV8=;
        b=X5t0+GzYD5nQTLJogb8ShMcffUPN8rYHHkRmbfRSQ0epRn9cgzVhm5+brblWXscZcf
         sTy46tcn3G8eDTi0AEiEt7vOC/aLOxVi9c4AGOxARz3aLYocffWkXqA+DPKGhVvRq87J
         QGfzyWdUs5T9Aw9TO1IvNWGVqHJn4V1M8kwhVuhkzcLC8DCT4P2nl7+C3YsxXRFHWZbX
         y5W9zbS0evuMWQLahaDLgppXCx1+dWo6M9UHudxWLpaCDUJMy8XOlHsLpvQRZnjJD5OL
         79ucv5oxUj5IlQnQTSX7pv4BT14R1/fwDDvqUttlY3B3C/Y67+FM5iav1p86f9jixPCC
         iWSQ==
X-Gm-Message-State: AFuF++nrP8nw9uNxRcYXEYBYYlqBliZgwXqLmkx67tqBWzncNeaSwEAn
	xCn2VTG/5/lvgd3VYjq36JG7rq12Qh5nZY9xysE5vobU0LgmoQheq0R/
X-Gm-Gg: AYBFou07InN5rKR3Dk5eAVpIfn3PDMefPa9TX6J4JgCwENFsA0tHs7U76BZkerkVdek
	i5an2kf1DmNrEUXUpta4VjhUaiN7EXu0Pf3wDDTW9UYbzvaBgT0l+fxBeYWL93BykEpXmh4yuaI
	If0OzdFHn8wxfDUbuzTifvaXdmZcyicnzIOV5PO3cDha2rCUOXrk2WlcResZGH4evnw2huAwUpK
	qjeTFBtaGUObGF7zI0j9eDdoRuSUNi8e7URJ+hhA/vH0tktlEy01vI+/0vSlydIOgjie681r2oU
	IE9Tqb7wXcTHJd62Llz4gXS3B7jRs+F8o5qcm/pqF/vJoUCpglbTtNP6vISteDs0bh1w5si/sQB
	kq4G88j3LumTePituA1S8UpJlaXhCZLo7jKjyPJQbWsBKyaUaJiTcnUqoo2jgGTagWCdvb1LXQZ
	OX0Gj6jUVDp628KLPGBz79WqjlR8EFjn2EOm6/OBW9s9nEvtLptqEqYSjfGzU506CNLCL9zInia
	R+i6Qsxy5X5sM29PZaw51Kft7pAzvNx1g0lPRL9
X-Received: by 2002:a05:600c:8b6b:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49e7a64acc2mr29705975e9.4.1789370163158;
        Mon, 14 Sep 2026 00:16:03 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm25161082f8f.29.2026.09.14.00.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:16:01 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v14 1/4] ptp: ocp: unregister devlink before detach on probe error
Date: Mon, 14 Sep 2026 10:15:52 +0300
Message-ID: <20260914071555.11684-2-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914071555.11684-1-maimon.sagi@gmail.com>
References: <20260914071555.11684-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devlink_register() runs before the dpll setup in ptp_ocp_probe(), but the
failure paths after it went straight to ptp_ocp_detach() and then
devlink_free(), which opens with ASSERT_DEVLINK_NOT_REGISTERED(devlink).
Any dpll failure during probe therefore freed a devlink instance that was
still registered.

Route those paths through a new out_devlink label that unregisters first,
matching the order ptp_ocp_remove() already uses.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..401b04f12d2b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5119,12 +5119,12 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (IS_ERR(bp->dpll)) {
 		err = PTR_ERR(bp->dpll);
 		dev_err(&pdev->dev, "dpll_device_alloc failed\n");
-		goto out;
+		goto out_devlink;
 	}
 
 	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
 	if (err)
-		goto out;
+		goto out_devlink;
 
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE,
@@ -5151,6 +5151,8 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dpll_pin_put(bp->sma[i].dpll_pin, &bp->sma[i].tracker);
 	}
 	dpll_device_put(bp->dpll, &bp->tracker);
+out_devlink:
+	devlink_unregister(devlink);
 out:
 	ptp_ocp_detach(bp);
 out_disable:
-- 
2.47.0

