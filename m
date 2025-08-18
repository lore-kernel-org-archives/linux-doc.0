Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18176225390
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527350; cv=none; b=bVitGw2bY27p3Cwll694GVwNLSQ6pz/dFfnr8cLSIXoexiBx7CmOPwFa8dUz1+myERuiSZJSEEc3Rq6P7Y5H/2Yj9VOMp5Og6kbfPZQRFaHy+rdobWQ+OeSFV1pWQry125rJcclXOl/OI2dp8UjjzshBsqpwbpww4uh/QAJZEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527350; c=relaxed/simple;
	bh=Atcf/onrjtwlUDJDKbgX+nxH8WoEO/HoYTnRVc1sXTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dwi22AWePa2WvC6DKDquSjed4gXYLgp/9DPvQxLl0z/S9aRBGvqaPZiytFag8L5PZ/bUqcYkkD9cgi6fDtM5IAPVlN6T6XU7ugM/smJQB/853m86u7o2jrQnjKGBrYu5bLnXBJEGAiIVxt1gWm9R3Z3k6idqo0NVKxqcA1tNdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Ct0a0Gt; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Ct0a0Gt"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432ccc4f9so1122152039f.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527346; x=1756132146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1k1mjvOHwuify9LTlOteZLmh387iXArNoe6DszPTuA=;
        b=3Ct0a0GtXUmplU5qI0Q8BVm/wBsDt2ZGxAPGxK0wRomjXvqDHSKxAlWMtNSJZLX+Oy
         5fSGc4ctmtpVJEzmAb+Jitdk/PnY0wOMm2vGlh45cePIFqtawEO06OlUJt8bJpJRdn7b
         THO62ceIv5nIo6CwMS8L8D14lJwpmd/BeukBu9kxtv5SAEBb8Ty4cZuVDszVdYUhAjMS
         8ufY/OShbuP4ySi/9E5ZrDCNRgwWcmYGYtBgbbkQitc+d0tIoH2fMwFgoLdOk7CmOmbx
         vvulinrMHFJzs0rRJzK+Leyh+CnhVnEN1e1eD3OmQvFnMFBMddLpTLymgy39m2+tDNaj
         Fgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527346; x=1756132146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1k1mjvOHwuify9LTlOteZLmh387iXArNoe6DszPTuA=;
        b=bVu7A5KPueXRZ3P4d6xYgqjoT8wupNKVOHVu50KKRsmEMtXM99JyxKI/mCYAFXnmGF
         juS3htpN0JPZIlrNUrGE7+B/4tdlVOhyAokgwYafrYIVBmXwRYyO16qwd+Bw4j+bXu+Z
         B4wedtmFj7HvHNJGjNbH0wTXQBsX7up/220DqCrLhsBcrTdKiMzkE783xA4PmoNqVc9l
         2sAxixod/4iaoq5jrT2x2hwXY8nrGdqs2qrUmVjrfzsHQIjDNWp6b6psJHlgi7STB8Z4
         2HAQv8DeoVOhwgGcAytAqW6F+QtSpWVZ3kdCWLczoCTtbo60mJlnYBXAwJIv0Rh87icY
         Quaw==
X-Forwarded-Encrypted: i=1; AJvYcCX4rsOpFkkvBX9pAKnZM0R5aYJRtMRkI04ojOXb9TZbVOsgcDpaog47++gZwRRWL4cF/jSjuNWqpnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVqokqG8kOnZ4XjFn7AXZg0ZWZSuQj+Mu+SVfCntzSC+QIwpW
	z7l+Y56kKHAFsc5P9t9EoAaBuGmnOs4IIDc/jWvK7x8xIlLT6/GXi0LNgW64NINSzCCT2CA2D4h
	U/Bq86V+UAQ==
X-Google-Smtp-Source: AGHT+IHskcxyJpFYjk5Ryp9JEoiKYpePKMrSar2kRX1rGmIsjtIdsVkijDGJ4H7+mfWpdUH3OI2LF6xfPnW8
X-Received: from iobce3.prod.google.com ([2002:a05:6602:42c3:b0:881:9efa:4bc8])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2cd3:b0:876:7555:9cb4
 with SMTP id ca18e2360f4ac-884470f7150mr1505137639f.1.1755527346152; Mon, 18
 Aug 2025 07:29:06 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:07 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-7-ca2546e319d5@google.com>
Subject: [PATCH v2 07/11] HID: input: calculate resolution for pressure
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
2.51.0.rc1.163.g2494970778-goog

