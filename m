Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93E188CCA
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726162748; cv=none; b=IR3GJGi1EEuMWFcjcnNqWDPqiqBhMi00gpmy1C9jCKXHagr7jLVdpTI7yI4FBO5C+KrEq1fzARs3NZ4ACOE5D1kda9CvmONIZkYcEunocga6vyMLoLzEJ9nhmJW1nssASNmdMJLHW2CbKP52b9UEWANecafPchtKmusznKRr16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726162748; c=relaxed/simple;
	bh=vnB+9idXhCgy5AVg4jFbptofzxlS7h1aP1hq2toSSZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUNY7jlRRZGcqKhWExlHudn0zDczjWsRQPGHGTYZhziBN+5NDjo5/FWUHfS5wkZajVrAF0gjtLBVnxhFIOeFlpNBZidFlTiZ6+6VHNJeL1mmVtUnDQqp4FM1IIhj81QSbv6KSkg/Enl4X/aKKOznYLFpKOp5wEzaYjlT7DnUZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dS4wlnTF; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dS4wlnTF"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-39f4827a07aso448325ab.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726162746; x=1726767546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkPvlYPCbX57sBLIscwM1o4s5S3tQ3XUG2CHY2rXX5g=;
        b=dS4wlnTFWaBOdIvM+L8o9+/rkD1o42AvboizmiMPAWG9C2qOuoq1517sqdV/lH2kXc
         Of3KUBA/eZyvAZLDQ6Pwoi6Dl0y43ZHyvhrMQR/ogHrBPNA9zw/wbdwrWSitXXFAq92t
         vYjy+SHU++wzVl/X46ABoCF7QQgr5Pl/6zOZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726162746; x=1726767546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkPvlYPCbX57sBLIscwM1o4s5S3tQ3XUG2CHY2rXX5g=;
        b=AFFPSHSH3yWH7snklT/is8MchfHdg+Q87bydWo1rLG+IsBnQaBIKWEZA2gyfJOgdG0
         8Bv28bO84DLQ9aY1KBluA0jKrd5R1FjsPa9uPEVGU2J6DZpgQETnVhToVevf29Q7irxi
         dnwmChq82ogvkrn23WS4TQ81MlP1BR7rNHs5AcsMPwgLVYrQs1uPuw2Uu/YAMiCPQu0K
         8y785r/oykfknVZLJlPAIB9SibTjdGKG3Vn3+aTVwqyaWfoKcHPDqEoHx4Tep5aKVVQi
         b3iAyNNrLroVoVe3NLK9rOoGiNWu+oPZael61bcSOlNwPaQLYW8zuEe2eSTgjsHVB2nL
         7QQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe6ztHd+N068Jl6dXcnn20uEH0KoWhLeDsIG83ch5/5eljQM6/BINvnWgzyHipDEQwkWIdgk4ULow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJbSBxN5WHhjfXd/AMRvuapVWf6YiUkcm6U8mE2dTwjO9s8wZ
	+f4Z+PIzXCIIDtyBIPCPfIgs5RlPB+A9kwVRk8ilC1ZYjC//m8bdA94sAfutdQ==
X-Google-Smtp-Source: AGHT+IFVUkbp4TmmxAsFzcXQPNvxYhKtSHk8lxW631++WJrjz1s5/fgX7On0NuVst8yiDDtcDIcjOA==
X-Received: by 2002:a05:6e02:1aac:b0:3a0:4d6b:42f7 with SMTP id e9e14a558f8ab-3a08495dfc6mr41140215ab.22.1726162745917;
        Thu, 12 Sep 2024 10:39:05 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-226.arvdco.broadband.dynamic.tds.net. [24.56.189.226])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a05900e618sm32570135ab.55.2024.09.12.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 10:39:05 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: linux-serial@vger.kernel.org
Cc: pmladek@suse.com,
	rafael.j.wysocki@intel.com,
	ribalda@chromium.org,
	Raul E Rangel <rrangel@chromium.org>,
	Adrian Ratiu <adrian.ratiu@collabora.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Len Brown <lenb@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xiongwei Song <xiongwei.song@windriver.com>,
	acpica-devel@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Implement ACPI SPCR v3 support and minor earlycon cleanup
Date: Thu, 12 Sep 2024 11:36:18 -0600
Message-ID: <20240912173901.3969597-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Getting `earlycon` working on AMD platforms is a bit tricky because the
uartclk is 48MHz. If the uartclk isn't specified, we default to
115200*16 which results in an incorrect divisor computation.

This patch set adds the uartclk to the `console=` documentation,
prints a notice to the user that it's using a default uartclk, and
implements support for SPCR v3 so that the uartclk can be provided
by the firmware.


Raul E Rangel (3):
  Documentation: kernel-parameters: Add uartclk to console=uart
  earlycon: Print a notice when uartclk is unknown
  ACPI: SPCR: Add support for rev 3

 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++----------
 drivers/acpi/spcr.c                             |  5 ++++-
 drivers/tty/serial/earlycon.c                   |  6 +++++-
 include/acpi/actbl3.h                           |  6 +++---
 4 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.46.0.662.g92d0881bb0-goog

