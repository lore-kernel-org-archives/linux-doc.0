Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560392;
	b=nd+t2nJwn5Wk6IVpt1GNdZd2ccrNmcsiI3xOfsTWtnqAncCOxv6WPujFnUQQNOwS/tM0
	 YaMP2euNCcncsqdtme9sfppsC0ipUzpkLPWjtuE8OLS0EjVEDFaAcDQjKqzgvpiE+QyG4
	 wLhnSDf/zT0SUJ1m0bMmMEVd5UTPok5gjIRq6cTcZSI/ktQq4hOxFcFt5E+QQ7gpgo+9w
	 UAmFmiRFtqHiMbq8NSBnjeLFeoMi7XnddqRjo7Mrpua2VsI5+YyIvlLv1Scqn7+vyjJDs
	 4qTH86Ru+C6WYVRuXIp6575MkLyZm0eNaeZ8sVGVcwFmcZIlyKCsTEk1w/0aTFtPZ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
	b=Hn6ptlP/BZJ/e8FTRws8vdy6ruspNFQ0+pcGU2w+VBE/H4z3DvHgqLWqJztlC9Ek7bZu
	 qdW+Caqq2VYsxkwXn+pzzmaHNuOHY2sCilkiAiFYgj68MTTUgVK295cT5P8FHzPdHivLl
	 NFYd6G24WDl+EJdN9WKuqfdVISIHKb3VVVSi7esde1uAMFb2CLyqfAtd/Hc0enads99JK
	 7JzFpAW6pDVzrsSIYfWQBIwPiAkQIkjGHeOdDoV1SxMUWun55Xgxg49xk/ssLTuRpiQJ1
	 65+HOCqRzNDao+WYySQp50iqsbIf1NwJ51W7UR8vk2SLGlwu+QPhrqJCk59nkPUfEnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9C606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D9C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b31261e8a9so5251377b3.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560391; x=1795165191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
        b=jSsYq7w/Fte0Jbwd3ZgHjpkdPQj5zrctw3Ra3G5X+k+yQzsIM8liMC45gamUdpRI4t
         5iryTRURqhtGVOELRtao1Q3ctAhSIPaF09AJJzYKd7sRDioGe4i6T0r3Vd/ZNhwbB155
         X+M8Z9wvIokU42uf5Ew97QHYCcshtJA3p/Ml4+6lW1Oz064+18FjzrJZyURnTolbcsWG
         ZcsrI6/6ceHxvMpq5YEZr7gE8W+jIkW0GlV2hlGnMO7OXSpQNVNto+Ghh7OZP3416+Yn
         p22OafVXzj5uB55mILFiLSwi7QLmWekuevnzehe33/0UZqAgHmgUB1kRBOwaHScC+EHt
         GZRQ==
X-Forwarded-Encrypted: i=1; AL+hErFKuPxkndWcfY01C9GWyvPO3hBnkkh+eQrOhdSnEVJV1d+1nWt5dsC+F5MVv5iF/iIrZk9T2MsVCag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OkOVzclmWvSO/G1UxyKeebuZ/TLqS5/jlyAtPsD2uIw0UeYaI
	ulO2XZnnyIcDbJUCTbDViSsMkgbGH+8lxZaQz+FIrjljX4cd4Abpb/p6
X-Gm-Gg: AYBFou0b9vrNDiGqFzmVFmnziRxwFfLVDFbc5Ak44d/oELt6XQVFNJ3YN8TZPn+pdj3
	tLHpSiI20EXZiEUKx0MPkM68ROgamRfSpe4YS6XD0LOwWPzwwsI9Y8JXynPDitJBa0LcAzRJk/m
	c7LjPfxapb/ZJgnobawS3dtRkfZveu4cbPMk47jCengFlhsww9Eall3vlU2l/5uCGx/L5J20tCu
	L72Yj/7g+Ux7Rj1QN5ia6+9A4iCJs/kOCXvI4jAOZ9vDhtg4rYchwKThKICTQRIOlPduu0m5G+Z
	R502MGgXX6Lb80MJfQNDzDwD/zYSTAxUsKzR/dm27fV50fJR73jfPhKb7mxKHiXEAPecyerY+T+
	pBXgnMNCgagmH9iZwgutAQla1oML/Tu02TFf43m10RHOvLnJmLAaXUK+g5hWzZtLzwNtEZdT3JT
	sUcaV5Es/Nwr2HhflolOM4gJt2SM+niEZKElXp8mjj/e75qpj/24//oeh8qtznqx91L05fazDwk
	qjj9eHaLk8e+wo1RxTNBecniiJCxHu/ovpnUSZQgqet+nEEAnrUqddIvpC43ueT3CMRrwj7ZZtc
	v47LbtXCzNqVZXk22zRvkYnKuRjusu3SuqRBx+63ohgR+V/r/tsLin1sWXGlqoSEJrmq8Tgewsk
	30scP9Fp6iVdfRLqNgTnvR9q8SG41bzdS
X-Received: by 2002:a05:690c:386:b0:8b1:e7c:cdcb with SMTP id 00721157ae682-8b4aa2f2467mr15379307b3.23.1794560390743;
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm15720497b3.6.2026.11.13.00.59.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: u.kleine-koenig@baylibre.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	operatingsystemsdepression@gmail.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power management and debugging
Date: Fri, 13 Nov 2026 03:59:47 -0500
Message-ID: <20261113085947.62594-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <avajebb1alBnAm8U@monoceros>
References: <avajebb1alBnAm8U@monoceros>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 07:23:36AM +0100, Uwe Kleine-König wrote:
> On Thu, Nov 12, 2026 at 05:59:02PM -0500, Joseph Telaak wrote:
> > +static const struct pci_device_id pvrsgx_pci_ids[] = {
> > +     { PCI_VDEVICE(INTEL, 0x089b), 545 },    /* CE5300 family: SGX545 */
>
> Please make this
>
>         { PCI_VDEVICE(INTEL, 0x089b), .driver_data = 545 },     /* CE5300 family: SGX545 */

Will do in v2.

> Don't include <linux/mod_devicetable.h>. of_device_id is already
> provided by <linux/of.h> and also by <linux/platform_device.h> without
> the useless dependencies that <linux/mod_devicetable.h> introduces.

Thanks, I'll drop it in v2, and check the other files for the same.

Joseph
