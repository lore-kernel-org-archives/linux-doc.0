Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883195;
	b=uVSeuCO3lMIKjpRgTIFB+h7V26YFlaCsYjiX56cajUrHHTZCq5OdIle80m6ZGTT4d3x1
	 SheyF3qrfjBMUA6Qn4RFe1cx/1eP/zlwUjDh176Y6T18eZrSU+jeTVN2zuRAUhHH2IG1o
	 CdGyXd78Pq7OS+K79frgG/JAbPRn1fhTJrBYZ0ZaSpIDf1UUpLS1MIkm/Ox8XdNahJbT3
	 hh1gsL04bOV0cU3vjIl5U2VHGPtgAzh8Hendjjt4A//U8AjoRTB3IX04KX6EY39/fm1MW
	 dqmJWClpBVMzps26CoqHcLoCVt7ivuq1SIcrFbbhK672n/Xbj1P9VKnVXWlN2bYwk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
	b=uduh81/mnOL64oAbdxx1ffyrkxTarulky0f82ExO/a+tPVTUdNMdLXM3Hvih7rd7sD72
	 SjBApJdjyq8cL48y4twdMrW1UDtuj1vrqv7zGIQFFLLnMgfQJJ+WEeY+o+73ia5/uLNjr
	 9rCwdHIcM/sP/VZNZOqV90xmgrhZiNteHmrTCphRMjI+3Mo2sMwj+10NkKDitu11PJ4Ra
	 FMTZtx0vTrnfe2hqgGLVl1X9owEcH71ezH163CvhtIqavZb/fwMM/ImHnRL/m4KIaNxz1
	 ByloEReMz+s/fWnAFhgM7IyQKaTYUe9IXo3OGz2kafge8FqpvO93oSR1w2KqCR222QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="a/qIsEoI";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84B606A31D
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 23:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C84B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a/qIsEoI
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c445c95d553so248063966b.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883194; x=1793487994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
        b=a/qIsEoIJ7JXd7dDRfKIL8boCPjx4/MXqK1bE26QZaFCzqI+Rdxqpp5jXFOSzVoolc
         v1zInRtKr9gTdubOUayPsUa8EJEENGSfm/QJ658WblAxdzVHz6IR5+Y/xMIUovw8LP32
         2N33OQaEcr9CODQSkmjNa0MU4vKwhesNS056Iw/GDxNcsoD06HhJ0ndiqAbchNfbgEzz
         keKwlOTRZaEyIU2PbyOxEsaZu52y+vk1YK1OdzGEc+Vj/NR5KxnLiO95355/5QjEjKWv
         c/9nz4/uF5GK1Ie5KxMEiNnVeo6hqhl+vaFTq94nAKXAjgkol8yoHxfUJpRw9P8y5Isb
         OH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883194; x=1793487994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
        b=Ygntvdn68fCyKqPTfqW3atiEFTnfDrGRQrPoA0TlvcFmq1aAv3j3oqWZOnyqKXFrsl
         aKbOwYOhXweQtCFrTfYjRuADlQYpVbcR8Z9wo4CdJ8gIUGm2zLgU7NuI0uIcI+kExemr
         63Yhm2G3XpsR4PGh8rpJ+My+uRE8Db55jaFt3TDHxVKx9YaOUACeIcjZBVUncrYDFTk+
         gP8pxQ2RXxAOEndPHArK7MQAuto3Er47HJR4Aj7ONp6DpRAdGzXPDd1I/Gm1lkrNnwQj
         2Ip5Lx25pR0cLHCI2gJKBhPRJrGXZEUyqkAwVGnPpq4tZ5QUmJ9lPTige/JbTnnWmUKC
         P7+w==
X-Forwarded-Encrypted: i=1; AKwUvBwecfoiODiCeu9NRkxRDSO4wdWj7G9mT5E1GSI0g5pcztjvq6W7CaUO93TDqc0qFxXoDDAR+lvzAvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRsdNCkfYiWcixLjfQG7nHDIn7sR7nwZ55u1YE6OlhRS4Hm4Cv
	0yWumHulC5P/6L5oFAjmXx6j586whCbNglHyPgLqYS6ivfo8FppCFeUl
X-Gm-Gg: AYBFou3UvNBz70zayM9tGwYtdbxYOMqJhk4dbHU87ctwuq3bPQ72nZsHmSkyC6n4fdP
	4Ay88eq8Ynogu6p1F6cS9aNrBPBk4p50iaNuC7BSc9UBsLYy89NJGoy7kYS0waOZLbMLbnMh6su
	emNVrdOChUBp7Ptlf4CybNt0ggtaf0MCmT++9nC0jqcd0NJ/YuEf2/tvRVnAq7mq7ZUe9p5YTeH
	4Ut+d6mdhMeLiuf+k8T/lgYRRJVsmeztsIRuRDEBd/TJ4JoMij82bWaf68IYH/9PJxZB5hqfvr+
	x3UA0/YaLKPTDbBFMsqE40gPUDXF/D6UlHbKdjjCeePxXK5o7+jaTeIr8PDxcIccuuugiXoYzJ3
	JaY3N6U82qKwc5Ibc5RHKa6K10HkYPUzI/a/uV5o9ZNhxxeAxDQoOCRibM7jsC6pQrieGR38mjm
	Y1LpmVZAVjDwmLXY/nEzXJ2dlBU0tlBL+B2inoiA4sXkwEs4Yxrk6waCZI2rO18pkLzh67leATq
	cLpMx1Xl8shFySOoROdWXFaJ9khQOxDnoeNSEJX7cBQG+wQokw8ChI=
X-Received: by 2002:a17:907:160b:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c46bdaa7283mr360392266b.2.1792883193723;
        Sat, 24 Oct 2026 16:06:33 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm141551566b.51.2026.10.24.16.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:06:33 -0700 (PDT)
From: Sam Crossley <samuelcrossley@gmail.com>
Subject: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Date: Sat, 24 Oct 2026 16:06:02 -0700
Message-Id: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo53WoC/3WNsQqDMBQAfyW82ZRErdZMhUI/oGtxiPGpKZpIE
 qUi/nvRdu16HHcreHQaPQiygsNZe20NCMIjAqqTpkWqaxAEYhZnrIgzajAoazx1OPZyodPog0M
 5UH4pEBWrUpUXEBEYHTb6fZSf8LjfoPxCP1UvVGFv7lqnfbBuOf4zP+TfKv+7mjllFLNzzRKsk
 7Rh13aQuj8pO0C5bdsHENRCZ9UAAAA=
X-Change-ID: 20260926-netcons-replay-upstream-189eec0b4c79
To: Thomas Gleixner <tglx@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paolo Abeni <pabeni@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Sam Crossley <samuelcrossley@gmail.com>
X-Mailer: b4 0.16-dev

leitao and tglx had discussed this at LPC, sending RFC as suggested
by Breno Leitao.

Netconsole only forwards records while an enabled target and its
transport are available. A target enabled after boot, or one that was
unreachable during a network outage, leaves a gap in the remote log that
cannot currently be recovered.

This adds a write-only "replay" attribute to the netconsole configfs
subsystem that rewinds the netconsole consoles so the retained ring is
re-sent. Patch 1 adds the printk helper; patch 2 is its only caller.

The replay is best effort. console_try_replay() uses console_trylock(),
so unrelated console activity can silently skip the replay.

Testing: verified in a VM and on a physical host (the latter rebased on
a 7.1 kernel) that records emitted before any target was enabled are
re-sent on trigger.

---
Sam Crossley (2):
      printk: add per-console replay helper
      netconsole: add configfs trigger to replay printk buffer

 Documentation/networking/netconsole.rst | 14 ++++++-
 drivers/net/netconsole.c                | 25 ++++++++++++
 include/linux/printk.h                  |  6 +++
 kernel/printk/printk.c                  | 67 ++++++++++++++++++++++++---------
 4 files changed, 94 insertions(+), 18 deletions(-)
---
base-commit: 00513fc3d6c467b1ef3c101a2943cb92de25c49a
change-id: 20260926-netcons-replay-upstream-189eec0b4c79

Best regards,
--  
Sam Crossley <samuelcrossley@gmail.com>

