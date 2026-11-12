Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463353;
	b=1Y7J9Ux8O7z5kq9pbNZTIl+vV3bgDjOb0+OHlq92VGJnMnKU8YJd+bK+ZxX0yhBl4HSE
	 ua+76mjKCo7sRcftnzcZBHFyIhEs5F6O1iTeXQMCCU4inLFxK5SZYJgvYaOTsKS9Tfd9r
	 6Npo9udKhh9hBnQDByCcSWFN1xuBit1jmNa4yCD9vzRXBTiSuAC6cosipwBEFOoW5yNHU
	 rAEcr4DENY1w3h02vxuxR4NLnqExW6rjviNVjPtGvB9lcxa2D1iXKCIcNAe5PPew959Ws
	 CAdktCdCfrxzEmBCa3ob+RowX+v+WMcJ6xcF+eit5xlsIsFZYlRlUauIv9f41nCH7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
	b=QeRm/c6IvTxai6WZbatsYGoPG+hqlqMnonrXmAvhZ3QLKL2MF4INhkCPY/4y+t5X0G8K
	 p9uNvhFjE8zFFHYlAMDsTn6fSjIYTLf/qLXsuHmqxUrEsGpYikAkBfkIYZg4KRaAk8CRc
	 z3wQZ4ZwGVxw/KOsghvVsTvR+tzdbCln+UahvTNxZ5L3LGIc97QE4SuqNpico3zAo6uB+
	 hPxHQJ/2D/UjLKbvqx1EEzl5NW8DV+M74DtspkxWx7JoYbDRe9NA0f8fcRi+g16tyhfhI
	 4SAH/WiTiNFkWnHauhzFP2pAldLk3qWLKMojMKmeVbNRQaVN7BiGQK6GngsWmFGytqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9D606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a46UpnvK
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so2271769a91.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794463352; x=1795068152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=a46UpnvKbWTNlsCa+FpDBLlf/4fLcpzR2NUPtorGMWEnbpDpK9/8303wJ6S0fITbpD
         EZTIqtKNtt/9pwIRkhnmNr8rMBGuI3CErXj3shpsSB79t84OGOXeWMEffSp9zfUFzdzw
         q2pqI7m5VlWh5skqpYgyt9o+2MeFn7SmvrcPj5fC7FEMHZZENXtOD5aCA1mVzG/wq332
         I5km1JgJNizRSyWkvcNAV2FecjH5V3L6uot7ls0+JzsVa4Hm1jI77cexThx9P5jC3QdO
         mqOlBqTC80NNZGeMFNCYHMfrnt6ivd6QCaQDvU59cpc8UEKX4zZJ5smwaKNhxyQs+2S6
         YDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794463352; x=1795068152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rw7Bx0dLkNzuOX+yqngAb7zMgStoCLsXZz0OyPBFN3k=;
        b=fAM6gRmS6JXCLrNmMIiZbF0pFBfafU/Qbzdmzi1kwuytIByHu5VydKkiNBclDBwUY7
         LWmv92aOcSYwCvjBY+tzRYvgYtJwbRZhOwplj4ps3ZpwIa1laVgTYeBcswdTV7HvUNBL
         PMmJImhfR+ADhLVv9dA+adPEj7u/OwizHVbUwl041bZa71+RNSBwpz/VD36Kybq/eB8A
         3PMH+sBOLyMdRZr1NGVMDeTYrvXhVxgkLKVkumIr1p2MfRTzJ24SslXmmzoIkTqdeOOD
         WD6tQuL4Y/SEW4qTAREyHP3AjOqvgae2VfsLavLWSEbbld0yBNLcFqA2JHQAZ+cRLsTb
         RsHA==
X-Forwarded-Encrypted: i=1; AL+hErFJEY4ZCw0Lh9g7kr2WRVWiv1mmmugUrEBTxwg9rPtDco+oUsSPYF0ellVVwyhW0abeeqowGXMJohU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z6IyMQQd20UylHBSCCCAdp8rcnzB8vKGF5ld7ciInDXBCRAx4
	ft7zKDnwi6qNqIBXz2TtIR9HqQwl8QD86/hjv1IrsYQyRvoA9iusmY/N
X-Gm-Gg: AYBFou2vPD3svfgPg4VaIilIacQ7KllGjN9n6Ifnf0JfZAc00MP86pvhxjbdM9VhQ6e
	3A9SHJWd/905NuFgaVzIs/UI98klr8/puq5p/du2+ndRTOqPTS96yyoxUSPfQdjIOQMwimwymPX
	OT1Du8PNIZu5VNzHoC9vxh8TaOYQWa4jMfhwoHuHIHtRi6f7Xo8lxK4Ls9Ch9sZ1Looi9m90uUr
	P6+Tf1h14tdTidgP1x8v3xt+Caw+/b7fquNeVAnMQj1xy8lHvwrvNoMVK+C7AKST8h3pSwAiRuV
	u9JWWGovtAMJKoiecWqjM6kkhWo0iTSaoRTlNaBnK4g3TlxyzWCbRNfRZ4tsgTGcZAB4Gc0ACrK
	BIFPJHPdeuC+mYe3tzp8qsT3KuwxY3kYuLJBNUQ0AFSUGFn6fn2vG49ulYifQ8Yx7Xj1i6OevU0
	sje9/nmMraTu+O+Lw+S0fi+mquvvbr4AIpl/YI64Oo4RnKzwMWYxmYUFy5pcZnWefmBmjKl0wF+
	zeyvhJXQPF5C78ouYd34F7mvhBdSV/uZ39pg2r1q4E6SCEgnjS8c2m9EmFHJuPsmZanP7kZNV3Y
	dS3j0fNv4/25KFntyK4jsPKvnetQDY6Kphs/eT40gtV7eHOn8OJNbXCLmAcjf6qOWG/t7lje7GJ
	RUeEcI/d85VK/Hqd6KsEiMa/awKzAsARN75cNSbXpE8dld6nhSAaQW/sF5u5KCsNtgvtLOZXxIA
	1gR7up6ELsuwsnlGC027KNWKGIILbDvm42ZUe8kRWxyxF0lg0d7COebg==
X-Received: by 2002:a17:90b:4a51:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b182f29822mr4190053a91.49.1794463352444;
        Wed, 11 Nov 2026 22:02:32 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (2001-b400-e25c-c447-65e5-0e2f-5b6d-25ff.emome-ip6.hinet.net. [2001:b400:e25c:c447:65e5:e2f:5b6d:25ff])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181beffcfsm3177149a91.0.2026.11.11.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:02:31 -0800 (PST)
From: Wayne Ho <wayneho219@gmail.com>
Date: Thu, 12 Nov 2026 14:01:57 +0800
Subject: [PATCH] hwmon: (sht3x) Fix alarm attribute names in documentation
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
Message-Id: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g2YKUjxKqWLOBM1xZ+STIsg3
 r1ju/wW7+3gYioObbWDyUdd16WALhXEkZdBUFMxhDo0RBTQx3zdMK0ReWKbkXM2JLql1EsXGxY
 o6cuk1+23vT/+9nf3lJjPFxzHF56ob094AAAA
X-Change-ID: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Pascal Sachs <pascal.sachs@sensirion.com>, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794463349; l=1932;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=zsSKgXhZU6KjZKkVqHl4QSQxcP74nzzHdwMx2Z6u6Pw=;
 b=8KLjbsfdy1taUMi+ZXefmWeolEFLVJeha699NRMSlNH6Es2k+WrvtaJGADLbhzB4Rw0bPZ2xQ
 ex4V/XP4UCXB9kOWMNojNXrLRihF4L6ErBXsXYtwLM7IHhIpQm626eS
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The description of the periodic measure mode says that "the alert
attribute" is set when a reading exceeds the configured limits. The
driver has no such attribute, and never had one. The alarm state has
been exposed through temp1_alarm and humidity1_alarm since the driver
was added, which is also what the sysfs interface table further down in
the same document lists.

Refer to the actual attribute names.

Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/hwmon/sht3x.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
index 4f67671eb0c..3c022c058be 100644
--- a/Documentation/hwmon/sht3x.rst
+++ b/Documentation/hwmon/sht3x.rst
@@ -78,11 +78,11 @@ The allowed update_interval in milliseconds are as follows:
 
 In the periodic measure mode, the sensor automatically triggers a measurement
 with the configured update interval on the chip. When a temperature or humidity
-reading exceeds the configured limits, the alert attribute is set to 1 and
-the alert pin on the sensor is set to high.
+reading exceeds the configured limits, the temp1_alarm or humidity1_alarm
+attribute is set to 1 and the alert pin on the sensor is set to high.
 When the temperature and humidity readings move back between the hysteresis
-values, the alert bit is set to 0 and the alert pin on the sensor is set to
-low.
+values, the alarm attribute is set to 0 and the alert pin on the sensor is set
+to low.
 
 The serial number exposed to debugfs allows for unique identification of the
 sensors. For sts32, sts33 and sht33, the manufacturer provides calibration

---
base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
change-id: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae

Best regards,
--  
Wayne Ho <wayneho219@gmail.com>

