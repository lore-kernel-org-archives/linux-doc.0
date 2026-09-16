Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40D137C119
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572780; cv=none; b=hC2Mcvksu8jyKbfv0yyhqyL2o3gwLbSrimmcbjcWDrdc92PwibKeN4g7jhqDpbUYXAb/1surn/wlIlFxnbcQA7+IaNkVZxfZWo2kdCot3NXLpXt1Odnm07OC5I346UDwgRn/rPKcJwM26d6z83iR0HPxCqRknDV2HUEsSRGmBnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572780; c=relaxed/simple;
	bh=/zZcWsZyiiERqW21qgwZOwA78F/SYZekoddGZXoMhpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9VFLLgw0QkrgGhHm3i429THQL+jqd55qPtOJPsM1yjmOeuASPcsKtBNYL3Ga4nQru2LrhyTvpqh4wSdyqzp0jT/IHybOmXO1a/mAUtoGKsJZXC7dqM1gx/uoTxlKbzD0UsBIESYlJf8UJZOg6IyCuD/kybcQBSmna6/FNjEDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTqCZm1r; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTqCZm1r"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso1468160a12.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572770; x=1790177570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2o1V2LPzxwvgGW3zNcUG+5E2H/7M9BqltvIjN9oO0g=;
        b=rTqCZm1rwwzxwbesd9HpO8HZ7ps9c1tPPryJmnsBGi+02SuJxCJvT82illM408QI2K
         mvmprRFKup4eOsZx8ilYHj5Mtew9no4eVjI0Xs1QQwOgVwerxvzuky2hdkz6cGUnXE8p
         y8zL9KQqc8WdEj3JX2XSa3yVBE7KfsyO2jYdkG21zyQxdGxlbHSpSLCsvUzEvTqFVSHQ
         KjEdAYo0ZgCBMEY7MgffeCMNomZIPQ6ICWBZWMCRQtFNbzhgZnLV/CAkxoVfxOdfFiA6
         52zD12daKe5itkd/ZX3+xwdK8tV17LxDdeFJIAKPFTSUuhFsusMvlHOSlEr96eadBkmS
         HWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572770; x=1790177570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2o1V2LPzxwvgGW3zNcUG+5E2H/7M9BqltvIjN9oO0g=;
        b=GCyNCYjthFX+isaTVtPnooSEK3LsmrtkZUWHbeAZ6N7ncjndL3U89lts5eoXYZi0gv
         EuFNBrA+CyvaQAMJx4/2J7VJ/9Hq38zYF2IAO0pKFmMyjZkaXObkDlpXoTKAbdg7XFhF
         kwcrZh50nNKzDsv0dblnSdx0Lk8/gWL+tj+RzVbaEY7kFSUPzPY2lknlbFruFZFYlKp1
         YRjMUYDto+VUGXlco9//6gEdTtdvrvU1XPXXqVG1ibx7Jlf4HVsgfw1u4O32N7+HwGnb
         SDOMywWUSmNVDU70SsECV/gwt3ByP/3wEEgxxYOD5vIjj028C5bHTRmPm9F4OpmA6QEE
         0j8w==
X-Gm-Message-State: AFuF++kyr3ZNUuj8gLBJHJmtot2NPRm1yiD811MAQDv63G1/bumIkftd
	pLokFdbquSZKM/TX/YIExnEF0heLcyg/6cL+LdqS1c+p6SrdCK6jPzIM
X-Gm-Gg: AYBFou0iSx29/D7RUilgBuYSzVf3Xkmq6ZWTlhQkbykIB2zBOUyqvCxAzCZxG82HnHA
	HZ5TcHPYtmgVcHRdU0yBx2Sw0AL4yqVlvFN1mKjO0PVtwibEf4AWoYpMaLlNLsBm6I3H5oFl6P6
	wMCQH0u/kwprMOwC9z4S6XIpnuS0ASGpRGzylouv6m65Oxq/HtDhnjpdEV0e3FIydA4SDpH/Zty
	NfHdUQUxF2iMUi3Z5rWPfHhDrEGx3uJBn8+v5xr8Pw7mOYF8umjG3eS/+myJLxAGpPuja/Ofip7
	6N2J5m9fyYxDKsrmaG3EZxS4ihtzWRvarAAXM12Ln0c9jgunhTrgBtlda2gGK6NDJggX/suHu1U
	XCUDqsNx9MTJxQiljNIWlLEF/nBh+WtdJhosRAXuljWFa5tSqCsz9HhZIeD7KrwzczT3LMw9vYR
	7+27rsKCCEnlMDrKwEUBZ6MH6RMb+ZKDb00tQ8maSlPiVjIvnPMaiJhX7j/iT0OWRQVe0sOedhc
	817+xMH2MnsH3maHRy8+BpB7eI1ucBzjuwfyh5ThA==
X-Received: by 2002:a05:6402:44c5:b0:6a9:cd44:bee2 with SMTP id 4fb4d7f45d1cf-6aa22443689mr1880157a12.21.1789572770270;
        Wed, 16 Sep 2026 08:32:50 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe0562sm2067081a12.3.2026.09.16.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:32:49 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
X-Google-Original-From: Sagi Maimon <sagi.maimon@adtran.com>
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
Subject: [PATCH net-next v15 1/4] ptp: ocp: unregister devlink before detach on probe error
Date: Wed, 16 Sep 2026 18:32:39 +0300
Message-ID: <20260916153242.157171-2-sagi.maimon@adtran.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260916153242.157171-1-sagi.maimon@adtran.com>
References: <20260916153242.157171-1-sagi.maimon@adtran.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sagi Maimon <maimon.sagi@gmail.com>

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

