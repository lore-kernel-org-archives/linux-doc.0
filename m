Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8531C0DF0
	for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729848790; cv=none; b=S4FoYYPV8doIlx7f2SnzxuoBgX6A4h6SQbwvDlQl45Z/gwDG7bAiF0JUSMxi1CuV/rzzpanLv8uZZcfCq6Zu7m+HlCHRqGwJEfD34wwY4Hz5k/R/Hen8VSUnNHDM3xf0Q1tvrKZHYJJkEmBFk4t1bK9/eYv1ZyAgTFq0MYT+ASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729848790; c=relaxed/simple;
	bh=JJ/e/Y7d5t82y7GqFYdBYuyUdcCxOpC4iH0/oGh9cWU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Xewr9Ow1PK+5910hQX9/Bl2WX6lvAVfkBWJJpPIz7DpjkoVC18JHn2xNZtrMtqEVQxJBKowFRczDwPcpc7i2NNMn66JsAnUjreN32MIe2W5W5EtiNZiHBOscxjlpP/1oc0tSs4aeIO54FHU50Ywggi7D4++biOnBc7qASD1aoiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anU/c5A3; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anU/c5A3"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e389169f92so36562897b3.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729848786; x=1730453586; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tuqhWRYGgjjam9B7W2GUDM6P6BKsivvZeF6kAk9BsZY=;
        b=anU/c5A3UfQxklD0zZOTWYw0/kN3e3JoKNHIBVKstVnKYKhHQc3+solzyqlyvlm2O1
         YvihBoO+t05OBb2vuDpXS6YwjIcVLpnVsz/AzZxeQ5AOeeyN1e47VnaUYOGksFUlPUfH
         PUaqLWXjUYcopxb9X2HLU9RAp/vefCtzsaZbOmr4W/iitTIui/6gS2qymlRQjggwCV+T
         L/GbNW8gIScFY60btkpNOnJ9UIUlkKIAchALBjfRJ8hUgwfxHF0TEBpX/w+brOXrpPxh
         eu6p/fdQ4clLtN1GnXhVHVFtWI1dy7yXmfJGnnfgtNgA/EJ4ETel0ZW9FePY9hKj9V2S
         Ko/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848786; x=1730453586;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuqhWRYGgjjam9B7W2GUDM6P6BKsivvZeF6kAk9BsZY=;
        b=Ltot4U+4RRsypYNWKKMQVwjXaYCO6u/oRv0ufDT3TmEp0EXv/lw5E9EkUfmw8N9/C+
         sC+PPT5w1fozQa/kXYHIBL1PWW2srM6dNzq+StVATHJSYBaiXBxzXaw63g9+IUsNSN3X
         FlP/1wKbbV8xR9zBJZYF3slMyWRvUVusJOqghWqwpVLIBfdazOgjzaf3vbCvHtBLrghn
         Ohk7hcYnCW3E9SYYYEzJAGPN8dieyR9YBqWjoh7Lj2p+tRaGuZs89E7mPyOEEWRiCbMV
         IBNYTpj+hYfjfuK2CgRk6XcXtb1cu90ty56SSKtgy1pIZmPqL8BF1dnfzOXvUgdujIgP
         Iphw==
X-Forwarded-Encrypted: i=1; AJvYcCWvHM6PkzfBIzund43LWo8Wmj0ZqBTGXGqW+90gYqFKfRzF5nwEv1ti3ZnCZ0fO6Av3dd8D76OgbZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbzbeTbSl7d+sVRT3imbfX4tgjpbOrKmnKzftYr9o7cQuHiNv
	8PkLduazFxmlGATYTn3IOEp0HhgtsqjH8zk53wNPNPjq71WeDfhhPcVGAoms5rrFBwV6rYMri1K
	vzhEGco2DOg==
X-Google-Smtp-Source: AGHT+IECH9pM1rudCKXymTwKhtnM/AU69iz4LBnNjtGpR3vZzl1lATWUss0Na2UGHQecUxyzkYn2RvfW2Hppzw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:296:b0:68d:52a1:be9 with SMTP id
 00721157ae682-6e858147b16mr1078977b3.1.1729848786167; Fri, 25 Oct 2024
 02:33:06 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:32:59 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241025093259.2216093-1-smostafa@google.com>
Subject: [PATCH v3] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Also, update required architecture version for nested virtualization as
suggested by Marc.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v3: Reword as Marc suggested.

v2: Update nested value also
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe22..ed92e207e9a0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2740,17 +2740,21 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
-				   state is kept private from the host.
+			protected: Mode with support for guests whose state is
+				   kept private from the host, using VHE or
+				   nVHE depending on HW support.
 
 			nested: VHE-based mode with support for nested
-				virtualization. Requires at least ARMv8.3
-				hardware.
+				virtualization. Requires at least ARMv8.4
+				hardware (with FEAT_NV2).
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
-			for the host. "nested" is experimental and should be
-			used with extreme caution.
+			for the host. To force nVHE on VHE hardware, add
+			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
+			command-line.
+			"nested" is experimental and should be used with
+			extreme caution.
 
 	kvm-arm.vgic_v3_group0_trap=
 			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
-- 
2.47.0.163.g1226f6d8fa-goog

