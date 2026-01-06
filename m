Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72005695
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726558; cv=none; b=tJ6I6nqHJqWtjg8hLmGgHF4frLGvEsoIYz5qQ7UPOAIc/V6IZRUt5pI3hUQo0vjyWMw4umxIFJBwXqAQbl9gl+3QCtDlRFFtCZG7XCmALeBXVQSIas33UvVl3//B/u/Fr7JwhpPSJk799B5/HzMLOErSKIR0tK5ELpMsMS2mmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726558; c=relaxed/simple;
	bh=crmmpgYHpa5RdbN9QfB0hv+JH6CpIsDGdNmwc5APkw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG7FzKkj1iAKuBZzZytRgaXuedVYOlXSuir5XxOy5sbyitF+PPSyl3ctxw6znb4/TsWPFcpDDtWvG+dEJvBcFiej1ItPadponCruv2TwuoAho3ujHslCktOwmTvGh+nHUD55HNoMN3JZGvqbKv8FwB2rtl72noJytwLcXzjm7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tne+Mzm0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tne+Mzm0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a07fac8aa1so12842675ad.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726556; x=1768331356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=Tne+Mzm0EcDycWrgVr1vsvjuuCdTRJeUxwp3g66Mq0PzgAmqVZr1VM+4MPsBgYC2VU
         AYcv4dV4qxwuk60eR4AUwBtOwoIBbO0YYiyvnYk6jBtf1FIh2T2bASZeJ1Qj8+0gdgwJ
         0zTOF8fHH2mbeSrkBntc2dPK9T5GqXo8BYu0/TN9fEeqFIYAA0sBOSMb34SF4dSPOMc/
         k9clHEoZ+8KO947ECZ8cwujHZU+7zFX/T0+GWkDyK0AM/7eX9rBA7hAQC1a+rjqfsL7l
         k8ssdXxxwosIBmkzmR2HPkuJU/TWgaRdCV7yo2Va9IJrf3Nko7D6y7fmh/LRIgQtIsCl
         5j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726556; x=1768331356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhwaSoSDcJzaU6emLiSJOWLUcyi9EjvkM7Ru1loqRjM=;
        b=ijCI3tKr26yuLU4OFOG6XUvfJo1SCfmcrSG9T1aorA6tGg7Gevbc/kgbvnIQNtVLzW
         F3Asd+OIQYV4yC+xN7NbpGvZ33urui0W7eJKktomuEHXPWpFFABKReHvXw+5woYg7R34
         RXGUUuk4p9YSvXltXmUeHJ1tJZ957bcK1JoSUzwo6sOBb/c+j1ca5y7aSvY4E7L7TNv0
         HqajNpFoDTtTMeSp3ZOp8SHjPLAdjGbZjtfVMqHa/gB9sIUSwq9NPaRKvFVZ4lHT3XhH
         Qm9lrxhw0DehDjqTQxBIObBTxQKw9CeW+1izoMKsNKJU5OTW7CjsEJDZOaZhcnwxYzx4
         GRTg==
X-Forwarded-Encrypted: i=1; AJvYcCWBERao54W4r3G1lc+OuWZf+baEkvVhjR7rfK9X7+tihS4v72fN0I2SywPjBeegieY7URS8bUo8/g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgxC4SEjpUFGZyniIRIJt56IGDmjeHscjnPWdr9vPYr5OqXgu
	t+SzHyoUizL5ryakEgbdGFtwQbldDI99iwkQPUAYADvNJGm/fgkGqyc8
X-Gm-Gg: AY/fxX5Mc2as2E/D7VSevm21lYuvuAnvdbXrsxVirBLK/LRE3er8VO5HdcBhjSA28sT
	kbLj7ty9P5yZr3adubFeHVgiNLhXCHCYd/mNlxNfor80WwiwnCRZqDaHSY4PgLeurBmezYKuYws
	iIenAnZGBEg7BNboHhiIZ0yP2Wo9gPVkXf+hpqLt9+odFn3RKlinciqwFp3/EepNqmy34/BDEqy
	3vmCW0XBQEP5sBbJwFt7fn5i1/lzl/tsC5SOjrbFF9HNbw7dQ8skxQh9FYclEHC8D0k9uuh6sAm
	t/b6JmWcS/JGgCALn5iXMwhaDzyXFSRIGD+IRHZdG9A75zShGrRkjg8VmPp2Co2f0TyUoPfQyiy
	TfG9LBXmLb/skkTWNMiFOlhyvwwTWsdZ0u87isUngxav1ylvcg50+E62eyqNiBs+tWqWyRtvq9h
	AFYB+Nd9/lwNZRjwTrRw==
X-Google-Smtp-Source: AGHT+IG/FutjzhU827sNvJPVoR5OnV23bzd0idPEqRV+0+0JnOaD0+CqzPWXI3rmEXY695v5Rtx7sQ==
X-Received: by 2002:a17:903:b45:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a3e2cfcf9dmr34016045ad.32.1767726556016;
        Tue, 06 Jan 2026 11:09:16 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:15 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 1/3] scripts: coccicheck: simplify debug file handling
Date: Wed,  7 Jan 2026 00:38:34 +0530
Message-ID: <20260106190836.36630-2-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit separates handling unset files and pre-existing files. It
also eliminates a duplicated check for unset files in run_cmd_parmap().

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 89d591af5f3e..2efb74afef2b 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -138,7 +138,7 @@ run_cmd_parmap() {
 	if [ $VERBOSE -ne 0 ] ; then
 		echo "Running ($NPROC in parallel): $@"
 	fi
-	if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
+	if [ "$DEBUG_FILE" != "/dev/null" ]; then
                 echo $@>>$DEBUG_FILE
                 $@ 2>>$DEBUG_FILE
         else
@@ -259,13 +259,13 @@ coccinelle () {
 
 }
 
-if [ "$DEBUG_FILE" != "/dev/null" -a "$DEBUG_FILE" != "" ]; then
-	if [ -f $DEBUG_FILE ]; then
-		echo "Debug file $DEBUG_FILE exists, bailing"
-		exit
-	fi
-else
-	DEBUG_FILE="/dev/null"
+if [ "$DEBUG_FILE" = "" ]; then
+    DEBUG_FILE="/dev/null"
+fi
+
+if [ -f $DEBUG_FILE ]; then
+	echo "Debug file $DEBUG_FILE exists, bailing"
+	exit
 fi
 
 if [ "$COCCI" = "" ] ; then
-- 
2.52.0

