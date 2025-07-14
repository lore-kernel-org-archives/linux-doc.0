Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3F25EF87
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505788; cv=none; b=HxWvIet5E7Hwi+zHjC9mXOcqEphFJp6BJMDfhqrEuKQ6M5UNh5s2bRF7ihynRDylfJH2289dqAaDnSqGuYTnu2c9e1bltmsnsOPVDClblYNwKcBVCIKrB7ileaKztky8mCTHhZ/ouPVhV034NQ3CMlhaBeXDiFSNUlHnoX3LzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505788; c=relaxed/simple;
	bh=Wj07uc8vlmcVFwwaG+KqOnRbxIFVIENOzHLiNdvyj4k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzpIJmcs1k13SYHDBxN2eCx5Va3eQ4g+Vhu8j2JGKe+t0tGctIbQYbspCwxxHmUpI+6Y8A8EYowBLff0sLsAMa3QBxwiqyEQoZ3OGPh2G247HJbe8SVWFym8BwNnY+neJeci8XoKOnfSNORXDpPlzhpjCdUWJ11oi8RqddxeuCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V7WiEdxF; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V7WiEdxF"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86d126265baso412730539f.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505786; x=1753110586; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KXg+nnRrj6QcbCtFDjmsIexAyHPfEUdpnx9NOU2xnIA=;
        b=V7WiEdxFJY5wMTRv3u/3tFsMI/EPJcE6mEgQi4XcBAb2+7owQSPrcEsTOruYQcVAFS
         h4gtP0ax9ntDVXCx7abPq8IkwtSM9NJgOEsR/ieQ8qqlF9h4J2OTEYaMzTzvN56+T2P1
         5F5PZgCoRGEiwcg+e+OQXIOcqzicvOAj9D+p6B9Qy+DdTaMLTNsm2dsMVtZMJ00eV2/M
         aDJAWv3aBAbtbB7jXiim2D7VGEj/EosmkTneBzXetoFGOAcku7dNbUq3RdTbcmtcpZ2U
         I8dw1owg6y1O+1OzQa/NyWob2NzdtC+y6cR2GZsxoaGZNJE6nsmhzQ4PJOQ88iJ10aRv
         +txQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505786; x=1753110586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXg+nnRrj6QcbCtFDjmsIexAyHPfEUdpnx9NOU2xnIA=;
        b=hplCmgGs6ZIh5r295IvJCpPtja/xcsWWti+pI679D+AhjKhVZb8/iiBf8/y5qsNalk
         mea3ZbamW3TDFq1miqhjnX+5Eg96QujLmrsUcI0XgfeEVQssbWrrRx+q5W6+dRnf3Nn9
         lV8SA838t7lkso2Mpo6PbsxQ+tcoqk3DxywC5rJSaaJI6oUKb09d1eEDRyL64Gxl2uM5
         PVL62NjSJ2QJ2Rrazh3jXbpSCMqjn8acKzVqfMUFSqamQT73Vi3QBdb6loTIc2xyQ9ic
         WtPpKQ9TXpcx/lb9JdsrvEF70GF6AqsEFCSMcT9VFJPtUKnbJuYkln0Os4eZAX921jpH
         KWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzF1KIyIPCgVcF4VdbRorbb6YS+ecR3Rd/pfmzEKA6aMllT5ycOzWZfEpEHXB6czgfzjC+dvh5aQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylNHh22UBt3Ye5NeQwZ0H4kVA/lx9Pms0ybZBFe3lF3rCw/JHP
	q6OqSVUSMWYppsqVi3qS4CxKZyXinr3vM6L4bMrJTTPKLDfHk4F9mj45duHovUJMoOQevfxnbzd
	4suf+Fy0PfQ==
X-Google-Smtp-Source: AGHT+IFP5MLxvfUExYo0yaLckU2HYF2gsyl5lWw//sDEDztcF7zqNGg73rlWEC/2cZwgZoIHQ4hytC2muViD
X-Received: from iobeu8.prod.google.com ([2002:a05:6602:4c88:b0:879:8855:695d])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:6417:b0:876:c5ff:24d4
 with SMTP id ca18e2360f4ac-87977f78015mr1469868939f.4.1752505785679; Mon, 14
 Jul 2025 08:09:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:40 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-7-71c7c05748c9@google.com>
Subject: [PATCH 07/11] HID: input: calculate resolution for pressure
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Assume that if the pressure is given in newtons it should be normalized
to grams. If the pressure has no unit do not calculate resolution.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d42c1fbd20a1cc01c04f93cf10f1d1c18043929c..1d59787bd0c0e251698e2a2944dae1c4a96adefe 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -303,6 +303,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 		}
 		break;
 
+	case ABS_PRESSURE:
+	case ABS_MT_PRESSURE:
+		if (field->unit == HID_UNIT_NEWTON) {
+			/* Convert to grams, 1 newton is 101.97 grams */
+			prev = physical_extents;
+			physical_extents *= 10197;
+			if (physical_extents < prev)
+				return 0;
+			unit_exponent -= 2;
+		} else if (field->unit != HID_UNIT_GRAM) {
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}

-- 
2.50.0.727.gbf7dc18ff4-goog

