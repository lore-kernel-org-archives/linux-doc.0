Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B96559305
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087331; cv=none; b=JQx97znObWhhG3trKngSBY946hN3VCOXxzUD5L7NZ5URcyX9SqgwX+rcmkmfhyzYHUmKP/spqFjsW2r+XolwuPgSW+7UqsuxNPIu8K0BQdsUFfsXBRrVv2aekCs/ofowL9Cjm0rA8F46eWEFhWuiRV+3hQmeRgAxKMUWYUQr9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087331; c=relaxed/simple;
	bh=XA55q142D8aRkadxqfCagWbQvXMi9cPh2wIUiWNw0Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxiyS8nNM3LEmlDRFrTBH82V5mAQYh/8mPmmOMfTdh/8G0sNuEeM4f+LAxvbvn0rn926+x2qkLrS1v8R73wHsNkY2Tyay51TU4qg3qc27cm4dUbOMttPMVx5JpzHa5dV9F8XzeyENdCQOWA4wzksL0l9kUsXb4y5J0PUlaSOzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmSMFL1F; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmSMFL1F"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso5913833e87.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087327; x=1790692127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Np0pzXK9nCSAZ/EqFO5RnAzXdV1OHTysVqZnz2yyn3g=;
        b=FmSMFL1FoGwl+TLSh8/4uDlQzap6oEjQOh1Z/XAEZDsQSbWlk3P4MDLTZ7IzKrsv02
         WVRJjnj6lheSfNIYw7+xfShqspXWVdwOwj4ab1y28KccfuwxATOqRmhB5UfD5TTLw/NB
         d0xQJdwgFG9lQROLugG9gAxpN4DaoCsEyfSXEbx919I1J7Xhb3mAqrXoC0p8XhGuufWq
         4z4EOw1t2yhKVbPx2LzXLZsbfXESCRfzISSvDlZLboo0mTHN453KAhwixPPbxCu0I8en
         7ewzbdwJakEGxNTR+ItcSPHWTzQmedf/fhPih4dvwIVm5YYbfu1fqyaaI2qthxkegI5X
         JOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087327; x=1790692127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Np0pzXK9nCSAZ/EqFO5RnAzXdV1OHTysVqZnz2yyn3g=;
        b=vFyumlYam1yTOf0ck+ob1NpO5eBcQUJ4NRP9qBN+N3MJb1IgDEWLG3a8Y/eb4P3pAM
         vOXmQr7NPmUPrBxvbqnOBQA2TI65IY3eokZ/dJPbZq1Ke0AiX2XOuwSxIlaUq7cwFlXY
         dvY+RpblIjiozw3s/KTgSd4XLkvslD/CBBH0AhoXqKPUysrs5GM2JasXaKYZvQ7lWnVs
         nwzWcPz0zF0VRWeXn67Lr2/GUktTZeUY/IUs7hVibawtwqat7CJwwj7kS0/NqBbjh0hh
         /P30J7TMr2Ty/pzBrsHDWUJ83uH36+aefIfGY501e+m80oRWUuVKHbxVBuIVx5+0dilq
         L7jg==
X-Gm-Message-State: AFuF++n2w6hvd4ZP3q4Rk15LCqdKE2OGu3cPNS0oUBMSH1MXKNkdIZb+
	Lu6u2JEmQZ8WqviwbWpaEsQd+XWByitHvZisfM+Cn7Wy8GIs2eBL3sH0
X-Gm-Gg: AYBFou1SiXBdhXE3AQPVybC5YI3KTe3FXCp5WZ34t8LRaQKE+UKOAAnUjfTbcz1+rGg
	rqcp+KuB6xz60GSXA0LTelwdZDw6FdBNpH5QqTWcWrfeYh0SyNP4E0gA4HvEN4AGPF+czYKLMx1
	f+m/ymnbMYZh2GsHAxXZF/1RC97E9rgVtt/XhBr5Ca87lrVHTn5CSaHQdDzzXMUli4KbfwD9Xcm
	2xQeM4zUHhXedkU+GPo0P9xNImcXCk8QtY3SHD+JcMC6KE9GDpbK1NhBISSk0mmiJnASR9wXgM4
	s6s3Y6mEsaAo+IhhaJ+2svonXhAWCUUY7Co9ZM1hDU6pLsX49TzSbcX4lk7i5ncSEOw9TbtWX58
	9nyrbYfBSOkeBiVnu1SFNaTaHqR0xUp0T7kYEJeUQLwCIf/M+K7FZU5+C+Q6eDyCCH1gAgzvWsn
	mOEefAOW9FiKdsXoQ2x2R/tEefLE/eUG8xdSsD623nILNb1vZ4YuwkUJAvGCiXZYotYXTkJrJ8H
	iAotVP61lYzlrllkkEW3R+t+6wP6LR3vV3Q4G9a
X-Received: by 2002:a05:6512:3a8e:b0:5b2:a967:c0bf with SMTP id 2adb3069b0e04-5b8c17f5f54mr4811816e87.10.1790087325948;
        Tue, 22 Sep 2026 07:28:45 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:45 -0700 (PDT)
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
Subject: [PATCH net-next 5/9] ptp: ocp: correct the CPLD bookkeeping comments and the flash progress
Date: Tue, 22 Sep 2026 17:28:25 +0300
Message-ID: <20260922142829.57740-6-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct ptp_ocp member comments overstate the locking.
cpld_i2c_adap_nr was documented as "Under cpld_adap_lock" and cpld_id_tried
as "under cpld_lock", but every reader takes neither: the design is that
the writers are serialised while readers may see a stale value and
re-validate it - adva_x1_bus_claim() re-checks the adapter's parent, and a
stale cpld_id_tried only costs one extra attempt.  Describe that instead.

Pair the stores of cpld_id_tried with those unlocked readers using
WRITE_ONCE() rather than plain stores.

The flash progress notification reported the offset of the page that had
just been written rather than the number of bytes written, so it was one
page behind and never reached fw->size from inside the loop.

No functional change beyond the reported progress value.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Fixes: a4b7c15aa78f ("ptp: ocp: add TAP CPLD flashing via devlink")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 45313143b6f7..e10f6b5149c9 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -428,9 +428,12 @@ struct ptp_ocp {
 	/* adva_x1 CPLD I2C (internal use only) */
 	/* serialises CPLD operations */
 	struct mutex		cpld_lock;
-	/* guards cpld_i2c_adap_nr against the bus notifier */
+	/* serialises the cpld_i2c_adap_nr writers against each other */
 	spinlock_t		cpld_adap_lock;
-	/* I2C adapter nr; -1 if absent.  Under cpld_adap_lock */
+	/* I2C adapter nr, -1 if absent.  Writers hold cpld_adap_lock;
+	 * readers take no lock and re-validate what they got, since the
+	 * number can be recycled - see adva_x1_bus_claim().
+	 */
 	int			cpld_i2c_adap_nr;
 	/* claimed adapter; valid under cpld_lock */
 	struct i2c_adapter	*cpld_adap;
@@ -442,9 +445,12 @@ struct ptp_ocp {
 	u32			cpld_usercode;
 	/* cpld_usercode has been read since the last flash */
 	bool			cpld_usercode_ok;
-	/* one-shot ID read finished, successfully or not; under cpld_lock */
+	/* one-shot ID read finished, successfully or not.  Written under
+	 * cpld_lock; the worker reads it unlocked, where a stale value only
+	 * costs one extra attempt.
+	 */
 	bool			cpld_id_tried;
-	/* failed ID read attempts so far; under cpld_lock */
+	/* failed ID read attempts so far; cpld_lock */
 	unsigned int		cpld_id_attempts;
 	/* x1 TAP CPLD present */
 	bool			has_cpld;
@@ -4616,7 +4622,7 @@ static void adva_x1_cache_i2c_adap(struct ptp_ocp *bp)
 	 * the rest of the binding.
 	 */
 	scoped_guard(mutex, &bp->cpld_lock) {
-		bp->cpld_id_tried = false;
+		WRITE_ONCE(bp->cpld_id_tried, false);
 		bp->cpld_id_attempts = 0;
 	}
 
@@ -4900,7 +4906,7 @@ static int adva_x1_cpld_read_id(struct ptp_ocp *bp)
 	 * worker that had already finished reading.
 	 */
 	if (!ret || ++bp->cpld_id_attempts >= CPLD_ID_MAX_ATTEMPTS)
-		bp->cpld_id_tried = true;
+		WRITE_ONCE(bp->cpld_id_tried, true);
 	mutex_unlock(&bp->cpld_lock);
 	if (ret)
 		dev_dbg(&bp->pdev->dev,
@@ -5047,7 +5053,7 @@ static int adva_x1_cpld_flash(struct ptp_ocp *bp, struct devlink *devlink,
 	 */
 	WRITE_ONCE(bp->cpld_id, 0);
 	WRITE_ONCE(bp->cpld_usercode_ok, false);
-	bp->cpld_id_tried = false;
+	WRITE_ONCE(bp->cpld_id_tried, false);
 	bp->cpld_id_attempts = 0;
 
 	err = adva_x1_cpld_write(bp, CPLD_CMD_RESET_ADDR);
@@ -5056,6 +5062,7 @@ static int adva_x1_cpld_flash(struct ptp_ocp *bp, struct devlink *devlink,
 
 	for (offset = 0; offset < fw->size; offset += CPLD_PAGE_SIZE) {
 		u8 args[3 + CPLD_PAGE_SIZE] = { 0x00, 0x00, 0x01 };
+		size_t done;
 
 		/* The loop holds cpld_lock and the i2c root lock for the
 		 * whole image, so give a dying task a way out.  The part is
@@ -5075,11 +5082,12 @@ static int adva_x1_cpld_flash(struct ptp_ocp *bp, struct devlink *devlink,
 		if (err)
 			goto exit_config;
 
+		done = offset + CPLD_PAGE_SIZE;
 		if (!(offset % (CPLD_PAGE_SIZE * 64)))
 			devlink_flash_update_status_notify(devlink,
 							   "Programming",
 							   ADVA_CPLD_COMPONENT,
-							   offset, fw->size);
+							   done, fw->size);
 	}
 	devlink_flash_update_status_notify(devlink, "Programming",
 					   ADVA_CPLD_COMPONENT,
-- 
2.47.0

