Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A317A2FB
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351901; cv=pass; b=YImvhWpdRHemEbpIzjKp8+vsDeRx9n33X44a/P7uPs9w5ZhFwJY4IPpuKpyC2M7X1CiK4KRrFA+5OSjTGXWLjv/YwqD0B6IR+TlCAK2YEwpxCJo1m/W5C9mw9kke+AMmit+aOII/D0GU62cEokbNsd47JzMk5KJeX7DnZacvlYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351901; c=relaxed/simple;
	bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MU6hqgt8WAQVM6OiyfjdKzbhA+W3XkLKfcNf6nD1sivmS3ZlRbXAvfxiHATKhaF/hopzjWfrQfbaCKonirBD3cRJerXHMTAszNusNPNGevvhh38yhVw7nZIS14QsxsjZWNH4d4dmSSNvfVpDpof/rrcDTo9JMUCqR6MBZAcBOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hej5gnly; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hej5gnly"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43246af170aso2083286f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 06:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769351898; cv=none;
        d=google.com; s=arc-20240605;
        b=dU6c6vxuxZQmTY4JNvj8eR4hk16pXoUMzpCZUm6O8Q8fqgax6hwRu0md7GImeljXl6
         zSiNziOjcW3LkMMYdB0gW4K+8S5UnHjGeMtC6BVUDHHuranXfaAU6Q6ahmkIr2UeaQBQ
         9TI8W90ri3TEd3jkwQWh99uUEAvuV/h4REQxCcwbmrX0zxn7bYDaJALLAfGgsXU9rFF6
         4Tk7dDxCf1gMGS9QQiNu2zBpOSgTo8tAYOw+Rj4fkc5ObiOkgoG+cNtAI3ucC3ILnGVd
         JK2OhQ+3R4mLZJfjLAI4E193mh0gyzKSK3rgFUVqhxoTI3IYh5ARETY9pFWOwmCXGlQ3
         tuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        fh=A52ZyYxOF0LqMMin9RUfyYGENzc39h7ecOmzG+ZoDi4=;
        b=ViVl+/mrDE2PZaLEdE4FoGE4uTaSewMwewjVur6TnhMur+pS3bIZhatz+SbDz5mwWS
         CAQxF3E1B16mzEeBOKWsc6lwoLszBkr7QGU43wdY+A7VBh/RPI0v3zOFAy8kurLzIYBE
         0axyraCkBke+3yatZgmz1cAcq+Vr9K55ZTR8Slz/bvDnneubHNcv7RmK8ci4Tl2fbyQH
         5uKKMe/To86NEjp62vrewie7X3QjpDbv4EV/UxmdRIfAUnqRapiCkEYj3wtv+ovFSzqj
         UgEVw9Dt8B0ZxrvaE8kVKZ3yRMm8z1SEzs+sZRHKTIEnHb6ou0ozD1P8So+Q7W9PsjFw
         jiWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769351898; x=1769956698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        b=Hej5gnly2g2JwdLfXdczP3KoVuDfOcu4rXxXv+Y31R3vVM1K1HIOWfh+apZwH8Wrnf
         e+a3TuAp/7AuczyQxjIT3+dOshad2KtvbT+yHMjtJJjVCfvrqbHc7ot7IrsoK2T7jYZ/
         eJbTXprQmGYMSRntYy8yXv6gYnXTFbQshdXwhLUIQQasVExUhL4j1m+hnKDvsoawmseB
         j26O5xhD1GJGcFiUZnR4lKqsVefE4s5ILxa+6TPwOScQtCtO0mLIFVmSYO/eSaIrdh7u
         7qZeuOzijzjxHImoIqD3mPF+iCgqMO2/jB7AOYwfat6v7Xdkeaxc6yLNkxhOYau+tx/b
         QePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769351898; x=1769956698;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84pZE36a3idAjaZKYB9kst9MTVawYeZWVWnGD1DYKQk=;
        b=YXMazB0my0XAv+ORz1VlNJscEDHP6utZHXi/PI3jeLVr5JFXG+nOGFrR1CbEiZsqOD
         Db0NhSO1P5FU4vvMa8QGfWPiGQNs7JTyzjxn9Y+Stzj62t878N3a89FSoYmwr4mTTLLD
         25BrEBI7fjhZgHRE/M0nN3mtCWp7S83/ubGZ3CZG+Agu7DB7PDTHpEpJwsL7fGeBjf8r
         cOrtPsMKwc62kiBnR33PWWPrfwbHULEtALA638WCJ0ty3geq6aqXJULqETcTYcXQbY+u
         B+EUKHlmijHisXKqfG8LvPvSE9ZVv18qu8SJqjBDRDn86KzUohZXoBUuNQS/9/AIW/7G
         /GzA==
X-Forwarded-Encrypted: i=1; AJvYcCUABh00eHmJjQtG2LFWdcY2EECju7Tc7xixwpYxWHnL+yYz1wrFSgY4TXz1GalwMhCowDiKdxTS/e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZryy7QUOqPP/ntxv3W6ZyJZmbVq+4Rmk42aI+VZMKfCHuIqvf
	RRkid/VY6kMMPxlVnH5AsCy6c7+kNZXxhTpAxX0UQ4q67cBRrHKkFS5X75O56gnStNRQJiYwVb2
	L8k7kjMRIiV6FIt/pZjL5EizPYx9GWcY=
X-Gm-Gg: AZuq6aJwGsT1/VninYpAXhEjTjIDP2FM5/ZPXxRviNW9kEs8mVLdNkjWNW/Or381VF/
	z2YsyrVoLHGfdTAIadXPLTefHL+9qbZSxJj1q2sdrqwVa35FrRL5nOeCAH6KimZb6kKuWP/G/cv
	DRaNWSx/ck7cNVofgg+LN2Hk/B/cOXg213Q3xNKpS8+KzAcIjI3+lsFrf9XngJYW6ckM820HoiY
	INgtKhW+MvuAA94Lllm3SQ5lEQUS/SlgwG0VxCFfw6I55a8XMRq0D1EawOhNM09CETC1UOXKviK
	D4dKxedmlDl8K3IO4saVAA+5SgI5zNKNjR9F0olzewK2zNrzS4UbJVEC0w==
X-Received: by 2002:a05:6000:25c6:b0:432:c03e:a78e with SMTP id
 ffacd0b85a97d-435c9d22f03mr3062646f8f.27.1769351897782; Sun, 25 Jan 2026
 06:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: john ashrith6 <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 20:08:08 +0530
X-Gm-Features: AZwV_QjkSg0nU-p-brwBuLkSacTlQxfgU2P83XhNs1JvcxdL-cfC0aG9rCiNAwk
Message-ID: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>
Subject: [PATCH] docs: clarify CC list guidance wording
To: workflows@vger.kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch clarifies wording in the CC list guidance to avoid ambiguity.

No functional changes intended.

From 416237c2cea7ccb4fa863ebc260777ea102b2b62 Mon Sep 17 00:00:00 2001
From: JAR2004re <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 14:17:13 +0000
Subject: [PATCH] docs: clarify CC list guidance wording

Signed-off-by: JAR2004re <johnashrith6@gmail.com>
---
 Documentation/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6..5a29111d6 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -403,7 +403,7 @@ interacting with the list (or any list):

 If multiple people respond to your mail, the CC: list of recipients may
 get pretty large. Don't remove anybody from the CC: list without a good
-reason, or don't reply only to the list address. Get used to receiving the
+reason, and don't reply only to the list address. Get used to receiving the
 mail twice, one from the sender and the one from the list, and don't try
 to tune that by adding fancy mail-headers, people will not like it.

--
2.43.0
