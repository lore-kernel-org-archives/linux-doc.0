Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E12E7370
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875942; cv=none; b=I1l6HW5Am8ipZ4V5ImBr2ZK9QPrWdCt5YlrQDdRSdUM4nW/BxfeICbbdKiYmt8vbS39J35OMyy3xipf6C844ZLgk92V8/CUuMKpXk3Zl9M3qgmQqxTX8U7SF3DWBkIr7dP6aw633FWHRpA57Nt0xOvaru+l390/dQJgEtJ4QemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875942; c=relaxed/simple;
	bh=2sVlunj/mZoHcoxd2cD4P4fdrzm4ewYqwvFCAz1C1iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrS0L1lL+ElgxkBte/u0euioCyv8TmT5QVvqOk+qo3FMUcDuMhBlzrGUpDl4lFb9x1ToKgOmNjJPF2BnvWGk3PzPJ1RGHQT4S7nVkKzD1NsoRloxNuII1iROmvSS75qzPXgXM+nj5MyiTqJxAXbPvS56zeAdkZZjHRLMOzjQ91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOEEziFM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOEEziFM"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1883856b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875941; x=1781480741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3bgmmYaDea+Gj+ghcKiuju7bxxh1PhtZqeiDo8GA5Y=;
        b=cOEEziFMnPrWp1MARMwpw5TofC8CzKKDDPAhWuNp2MyCv1Aw4vPbofKX8WPKhQvTxk
         bCH6V0u+D7UsUXNNCOj19fGE3RGNoPdYjOrkVZbY/OYOo6Q2G7qYEe39zYb+sbiq1rRp
         UMOk+1G0JFUJyB3EqrMENM29RJJoQY/OlivF013dR194815DmJt3cWHNm6Z00WlqD98t
         YW7y/N2NpE8dUuqgO+aKOtuDzjgIRdBQC5BCSlRHlRDiFkkdj9XPYLCymaF+jdJq5HtU
         AOiSI23KpSi4FYlihzELLSs/Iv7ZdcO9t5qp/10TVKvfEEM7UujlWhQmdi8ecYvza2qS
         UuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875941; x=1781480741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3bgmmYaDea+Gj+ghcKiuju7bxxh1PhtZqeiDo8GA5Y=;
        b=KvwbskRaYA1+IGzfFEnfnAm5de4qupWDtDHBbiKqmcOYWHT2caTbZLpzGApSN4TVJ+
         l1AjXWFzV92m+yST0M9/tHOfCasBClPAcQSXbQtwD/HIvjPfNVaJEVSPfMvDigZm9NGr
         N9lS7NLMn8KgfYf/TwC3D1I35DeP+fhIjby6ARtMY5HK9X9Koym4SUcstsWQSXYHvOLR
         7p9osuuDKjNetporaRgCoPR+8KWFNUxxRnxnCg3hHUuGeDYTZ3B1hbj5M1i9NxHuKOa/
         gfrhp72oKIwBNe3RLG1C8cKtpCkcW8ZVpxlUD8HjX9OPnHdKuPT4E4SzhmdZn41tMKM1
         qxwQ==
X-Forwarded-Encrypted: i=1; AFNElJ83gQCLl7gJVaKeN7ZMqW/PdxHhPgJX2/O9daPWybHHfOrHBri0w4x+2QGsVr2/TjE5RaJeoI8s6Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UrEUmwqaIsoaBJoabi2xSmW41ZGh3ijseLie63tGB+ZKiR0W
	zHvdGGgz7hjgybdVSDmwFeEppNoLJaTxppZ7NAQbzz4t1lzRyeJk4edX
X-Gm-Gg: Acq92OFZiCaeT0kl91DonzXlVfqyAppjnxrHH63wXDIng4b372oR/DiMKKDn2snYfuS
	H9BzhA5APzCoeDYWIMZ0ENkPGXLo0MNrxyfIi2SCHQ+/AMyEjg9TXI9oUQ2FjPpVYovvsNgANgg
	Sqqph+bCDdt+52yw1cLJk2dcdaOF2/vgnRoCH+H4AqVDybWp1La/lb7LKaffOKnP5szyh9V9BYh
	jtLfnYzU7+YtmC0QGGWOtHJtFWd1SCY0bXoihUcG4ywUqhE9XQ2K99X7CGd8ZEj6ZD0CkYU1fpw
	puzkh/HRjDVThBTo/ui4oqpFVTvYztNSgyMxQO9A94lHAJEqWrqcsPSInDyxa8TNo6HuozNICIX
	fL6RlK8hjdurk2VcBDtyCsVqoDWkij+YDHw/n9kl/6/jRT9hiCHGSFWcvJBxMpZFravWQ4g7mEo
	U56A+f9ohakJgorOedIcAYJHvyYSwmgPXsWW2Uq8XCE+OVus2kVuUi6T/oXcFqqm0YYuYhnXdfT
	XpR3xXyS9tYiQqaS7PcQg37S1uGwp3HxTpWn2bH0YhpHPhW
X-Received: by 2002:a05:6a00:808a:b0:842:4982:82f with SMTP id d2e1a72fcca58-842b666f8d7mr8968903b3a.2.1780875940733;
        Sun, 07 Jun 2026 16:45:40 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:40 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 6/6] iio: osf: register IIO devices from capabilities
Date: Mon,  8 Jun 2026 08:43:43 +0900
Message-ID: <20260607234343.22109-7-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the IIO sample push path.

Drop the redundant temperature scan mask.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 drivers/iio/opensensorfusion/osf_core.c |  9 +++++----
 drivers/iio/opensensorfusion/osf_iio.c  | 15 +++------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opensensorfusion/osf_core.c
index e0a12de01..61ef55646 100644
--- a/drivers/iio/opensensorfusion/osf_core.c
+++ b/drivers/iio/opensensorfusion/osf_core.c
@@ -293,10 +293,11 @@ int osf_core_read_latest_sample(struct osf_device *osf, u16 sensor_type,
 		    latest->sensor_index != sensor_index)
 			continue;
 
-		if (latest->valid && channel < latest->channel_count) {
-			*value = latest->values[channel];
-			ret = 0;
-		}
+		if (!latest->valid || channel >= latest->channel_count)
+			break;
+
+		*value = latest->values[channel];
+		ret = 0;
 		break;
 	}
 	mutex_unlock(&osf->latest_lock);
diff --git a/drivers/iio/opensensorfusion/osf_iio.c b/drivers/iio/opensensorfusion/osf_iio.c
index 5e5099878..3da3f2bda 100644
--- a/drivers/iio/opensensorfusion/osf_iio.c
+++ b/drivers/iio/opensensorfusion/osf_iio.c
@@ -6,7 +6,6 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/kfifo_buf.h>
-#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -89,10 +88,6 @@ static const unsigned long osf_3axis_available_scan_masks[] = {
 	0
 };
 
-static const unsigned long osf_temp_available_scan_masks[] = {
-	BIT(0),
-	0
-};
 
 static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] = {
 	{
@@ -125,7 +120,6 @@ static const struct osf_iio_sensor_spec osf_iio_sensor_specs[] = {
 		.name = "osf-temp",
 		.channels = osf_temp_channels,
 		.num_channels = ARRAY_SIZE(osf_temp_channels),
-		.available_scan_masks = osf_temp_available_scan_masks,
 	},
 };
 
@@ -265,21 +259,18 @@ int osf_iio_push_sample(struct iio_dev *indio_dev, const s32 *values,
 			unsigned int channel_count)
 {
 	struct osf_iio_state *state = iio_priv(indio_dev);
-	s32 scan[OSF_MAX_SAMPLE_CHANNELS] = { };
 	s64 timestamp;
 
 	if (channel_count != state->spec->channel_count)
 		return -EPROTO;
 
-	memcpy(scan, values, channel_count * sizeof(*values));
-
-	/* Buffer state can change here; IIO rechecks it during the push path. */
+	/* This is only a fast path; IIO rechecks buffer state while pushing. */
 	if (!iio_buffer_enabled(indio_dev))
 		return 0;
 
 	timestamp = iio_get_time_ns(indio_dev);
 
-	return iio_push_to_buffers_with_ts_unaligned(indio_dev, scan,
-						     channel_count * sizeof(*scan),
+	return iio_push_to_buffers_with_ts_unaligned(indio_dev, values,
+						     channel_count * sizeof(*values),
 						     timestamp);
 }
-- 
2.43.0

