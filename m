Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655A923ED56
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457921; cv=none; b=Mms8CYHqF+fFO6iHeOIyK7dj3w2vCDRu14HOFccs64tq9OqcEFG/VEQX+prsgY2NEc610AfFE11qsoabWmNQqcZnnK4Lv2SZJLaBvlLD4NohNyV4EJXXUAcLo7TcDXPyq2F4dWHnWppOO8yoNqCvlRAJRvHVZwrcBRut8Kyf6Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457921; c=relaxed/simple;
	bh=ZTAgaNMzI4qiekOqkv3pNeLxj5wOqxlFzSL0ObZQoaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LQmCIRnQkfM4tsCn3Vcy2meWJcuy0G+EUecJO42aobDhSv+RC1nEz/GvYWOyrYrxBYq809W6ZrP5wSrTipa+vAC51NVT2Gsflm1rn2IFBkuWrztxbGQsQ5oT2B+detWyxfjXAyqYGQB93zQWDk4e7WwHsk8L9d4OM9edDNmSMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1fTMjpl; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1fTMjpl"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86463467dddso188098239f.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457917; x=1751062717; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=B1fTMjplXpGS1iTbK6dYeZ95fWN25oPNuUEbaLnxmiqKHrvP8hGzncZCU33rzqojcg
         uYmnJ1g+kLVwiCdMxgEeuptR2jPqu8cAKAtFlqFVlTXogG+MpLeRWABIeaE5neV8BxAo
         NQz8QLdEVf59XiyH13SvbeOAq3n9oK0rRM6eBZamwYZ8RgoQ5qSsaPNIGfSQBG3Xgcs3
         zX4qOxT6Hm4ET9WfOW6KlTX/PAa9qArUfOz0ZPcMHSet9ckoLHrh9K9DhpE8mXUywYhr
         NSmfD1+kGK0XIpfVQCWvk/RtW/ZEeOO/ALT4Nf4uKW+eHq9VZjkYtdyLnyotyzMQj2ZU
         Kmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457917; x=1751062717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgz/COFsBAperIPw3jbaNsXNDBcCpCZIFlLHMRVJgqY=;
        b=o1ehB6fNFjXn6UzK4sc5q1AwQl+PqTGTB1UGOCl9BE8vkPX8HBsjLkOfPkJ2IviBeD
         KkvrS6ozKlyY2ZAuBU4tPaHoCDOOTLQV95wVL6SvTOSeFFGNwAh8yNRNu5P0J1zQuAIP
         ddgOaDgSR5QbSYwVAKkwP5OtgU1dLYgbRIwelvAWn3aCi+8TuMk9wN9RE5UrKzjPUUt7
         2Bxi5Mlr1lDZe0k9KowBW7RUI3q/qv1FYDZKndy0DqMZy93JemzbrxNJgpsA6otnW0YW
         QVhpyvj8VgVUPwOudQnvKWuNzu8JvImkWwgAQPqUNMGknRzGrsQntNWUIVTp1Yr02cZy
         GcMg==
X-Forwarded-Encrypted: i=1; AJvYcCVpxHV3TF4HISGr3pVsjlj0u9jZLB3My0CBUcFSzsLNhx/aI5fCo7bLrCU/4+uB9oM7fBcYGhENqJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxC/cUAvA19ePidYF+u/aV5y+f2DNhZq2pK+Cb48CxBX6Hiuqc
	5t3NpyhnuM3a3PifaPVA90po4AOUIP0gQBEIJjXLODZ4PfrPgTC8TpYJa6zTsls+ZK2iOaWZg0j
	vUca18hSLWW+tssE0QtAwpMeTFA==
X-Google-Smtp-Source: AGHT+IGjEFFNY2ukf5QiVzn6d0Iwii2o/2bYlxITJ69QjxdmPFLoVLBssIQF8Rhp8gGY8wow9/U+VX25kMai0q6pUg==
X-Received: from ilbee13.prod.google.com ([2002:a05:6e02:490d:b0:3dd:bec6:9d56])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1646:b0:3db:86fc:d328 with SMTP id e9e14a558f8ab-3de38c2e1c2mr57720245ab.5.1750457917550;
 Fri, 20 Jun 2025 15:18:37 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:02 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-3-coltonlewis@google.com>
Subject: [PATCH v2 02/23] arm64: Generate sign macro for sysreg Enums
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

There's no reason Enums shouldn't be equivalent to UnsignedEnums and
explicitly specify they are unsigned. This will avoid the annoyance I
had with HPMN0.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/tools/gen-sysreg.awk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index f2a1732cb1f6..fa21a632d9b7 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -308,6 +308,7 @@ $1 == "Enum" && (block_current() == "Sysreg" || block_current() == "SysregFields
 	parse_bitdef(reg, field, $2)
 
 	define_field(reg, field, msb, lsb)
+	define_field_sign(reg, field, "false")
 
 	next
 }
-- 
2.50.0.714.g196bf9f422-goog

