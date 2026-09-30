Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116F8369D5E
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 02:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736669; cv=none; b=Q+Hh3McLLzFrkjIQpemfH1enteFDmC9QTCNfLOSTJ9IcqLpiI5nUzPLIluKBf13YuXaFfDzlcUqhW6CHwJIsHNbe2LUmSMII43DeyK8Hn9HuvZre94sxxqOc9bgzr5bWyuamyTFtbGq0+QorbD9i+ISVu4FLW3R4iRM8qBk2aA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736669; c=relaxed/simple;
	bh=WQs5In3pWprR3zrRnTgoo/qUfCjyLE6wU00tTJoQt20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMWHN2CufuTZ0VZFepxFb6NlPslbE9WCM33SLp+XHeNtiVztuutPS/WO/mMMIYSwhjlLJpKLOY39t0iSwwtBHv+W0F8HbMBa5wy7oHG69ukW5QGinh+PtRF8L+lKbOrE2KAko8L3dBOMR2rObtSSZU0wxcpfScVjQDcnhhU14zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kXokne2Z; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kXokne2Z"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so4420345c88.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736666; x=1791341466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9PQZ/RdlGnjkaRoa0q1K5xoYon3f3vH5dZxAKS9M00=;
        b=kXokne2Zgt4gTNadDfRkTKi4dBhJCeZFUPGewtkm5xHDQOgw8qKQNXtCw7zZY0nFA8
         WbnIHhMP+pYUoLzTPqbUxBzHvW/UaOlv/Upg9o0Glky/qqze0+BRm9S3p4pFTx0ryghP
         bMWoJmckzIFbXMZ/zsa3Ynv3HmlZjUtlIw/vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736666; x=1791341466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9PQZ/RdlGnjkaRoa0q1K5xoYon3f3vH5dZxAKS9M00=;
        b=NwGXLHomNCtT0eNT0yBtryBD3DZdLDuEHv76AIh0NtESCqqMiLncrCWnCp7Sbpo2Q4
         LgOPFwtQ35AqD4FJYtFnHmaptNZxwtUGqvWJjDXIPQiNd0R/IhLUoxzPy9YAPGoo5/7x
         lNwGRoaPjq0S+HH2UmEx2u9QbXTIEFx3bQsA24kIgqhSqLzaP1w65JYxPY0wfCBIlOWp
         sJFVPKGQLeudmuKKV6YktTCh8NmKAECWRjR7UKSQMXIeKLfpbgePxKmUll+juIbib7Wj
         +6FeGh/X3qXg4CkTvL3UVjlgmSKmJ6+aKj+x5Jjp6L4Jcw6dXe4oNRO4tHVAA1chhba0
         EGbg==
X-Forwarded-Encrypted: i=1; AKwUvBwUhUurNLXzaQifV9It9iWwu5Uvb+xq5gypuzZynhWpuaU8Z5NQVMgPzq1lxhtymH0LVNtGumhp6EQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kIC0JtezoxxeYicYZHtIx0ZWs9MY/mYGaB/uImtzVOY9ROM0hk
	KLRkz+WmC/l9sXMtSGegjDyPnAjClMcaZT4m9OvtWcC2Nwc8LRc339mSD+gT4ZgrIw==
X-Gm-Gg: AYBFou39Pvp1qDfj5MHqtK4VFThowE1aam+WS3WifHJdc4HwwltU4swk7w1Eixh2rrJ
	RCiB4/Q9dlm47BODHHIBRTEGC/0MZvWRm92NzVeNY3pgHm3mA+ELsrxzl24UUoQ58DAU/IQ0vSQ
	ANnfjwKTx0q/QiYWRRZEtAhwr6RG3zhvecW/fFqWxUhxstctfrDNPqA3kr5fzWrRIIrVChp0oJc
	iSBpMXq5cHOpgDR1tTK0/XqiNS6zjCSfsJQ9IVJ0eRQ8CkHuRKmz56y3v80DGJYb3Zj0OSC95kM
	kWS9YV8m6rTEdoC+ETTDvD1uwhmqglJmEa3azfimO2Al2aCL9GtDhF0oAT+YRMshaq/iEpiSaO2
	9ueYJ42e8yXtW3TkOvtvtqgbHdn+28uP95HXsN8Lh4Q6etoGPiooa2YFWFB1snhHvG2IqI8ZN4S
	2v300pLMNzoHJPOX2AN70hDTWUujQK95fLkTaro3g+3jPDSpRie60RB56ax8s4OxwuSa8610tXM
	kSLMtFRaRqbM8eU9u5bAqinxSa3HxLNKU8l
X-Received: by 2002:a05:7022:3f07:b0:143:26ea:371c with SMTP id a92af1059eb24-14c9f218abfmr1529002c88.28.1790736665960;
        Tue, 29 Sep 2026 19:51:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34c38bea1bbsm2713158eec.23.2026.09.29.19.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:05 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 2/8] PM: runtime: More kerneldoc formatting
Date: Tue, 29 Sep 2026 19:49:50 -0700
Message-ID: <20260929194956.v3.2.Ia1cae8a40a24662df11553c225f4438eab65b7db@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In taking another pass at these docs, I found some more inconsistencies.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v3:
 * Wrap/shorten differently
 * Resolve a few other inconsistencies with a similar pattern

Changes in v2:
 * New in v2

 drivers/base/power/runtime.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 7e75f6d5df07..00d1981763b6 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1254,12 +1254,11 @@ static int pm_runtime_get_conditional(struct device *dev, bool ign_usage_count)
 }
 
 /**
- * pm_runtime_get_if_active - Bump up runtime PM usage counter if the device is
- *			      in active state
+ * pm_runtime_get_if_active - Conditionally bump up runtime PM usage counter.
  * @dev: Target device.
  *
  * Increment the runtime PM usage counter of @dev if its runtime PM status is
- * already %RPM_ACTIVE
+ * already %RPM_ACTIVE.
  *
  * Return:
  * * %-EINVAL: Runtime PM is disabled for @dev. The usage counter is not incremented.
@@ -1607,7 +1606,6 @@ static void pm_runtime_set_suspended_action(void *data)
 
 /**
  * devm_pm_runtime_set_active_enabled - set_active version of devm_pm_runtime_enable.
- *
  * @dev: Device to handle.
  */
 int devm_pm_runtime_set_active_enabled(struct device *dev)
@@ -1634,11 +1632,10 @@ static void pm_runtime_disable_action(void *data)
 
 /**
  * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
+ * @dev: Device to handle.
  *
  * NOTE: this will also handle calling pm_runtime_dont_use_autosuspend() for
  * you at driver exit time if needed.
- *
- * @dev: Device to handle.
  */
 int devm_pm_runtime_enable(struct device *dev)
 {
@@ -1655,7 +1652,6 @@ static void pm_runtime_put_noidle_action(void *data)
 
 /**
  * devm_pm_runtime_get_noresume - devres-enabled version of pm_runtime_get_noresume.
- *
  * @dev: Device to handle.
  */
 int devm_pm_runtime_get_noresume(struct device *dev)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

