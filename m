Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC84273D8D
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950609; cv=none; b=EmtsAGSx1Ix30WbzWxpbyP7bxatvudbVnhpOPRAPUEsyp85CtKkrLfv3E/pwHUF8Hxx/+gOqCz4eEWkX8pSnoGfjlVlhZ1WDkwxTgeOLotycOq/PRO44EVtAfd1kBCGzkUts5aYV23wYLfT++77YVFzK2LA8wvCFSV0XtQE3Yxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950609; c=relaxed/simple;
	bh=MvgwSe2uuAnSoqmyj7Z6BxaI7PVqfjMSmemWw9nwZVI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGknjt8huImTZahqrNIMBwZrM8DR3MuMb5+Br6WB/dLfEVQRRUCZrP5SWdon7NT2a8uMCVZyDMxUzMJqzTFyUAfoiJNmJ8y53R7SKpwEXdPgEih3FzwMO1mLzkv+QdV6avwTPecJfTBqeCgHBxgftg0x40+EFEjckXYipNvUJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo26XEqa; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo26XEqa"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37cd7f9de7cso69211671fa.1
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950605; x=1767555405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=Jo26XEqahZZt1bow3phaIBHzxhAzcPRO4iSMWbexkONb+RhC8n0KcHAwwDa8Af2/tK
         pgL46z2qw3F0hEqu67FmoIjIZXaaklT/sglRjO9cPAfOIK7afMAAFIN9Zycs2SgoIfqK
         iTxlxiul5J63SplcntsrpJtIatkbPkYY8zMuKqv+XFKDeF6VDu0bby45iTLt86uPQK/K
         LpAqNcaexCAYpkm4UCybEIJ9cFZ+i1YH62RgRVG1Zk8mOyWY/t6sBeSC9sm7q1+484ai
         aWSK91pcjJocah9bRGmTOjToq0Tt9JZxHtDUmoOo8p9dyFzASrfZjE/c5Dtk8vfaTo/k
         0Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950605; x=1767555405;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8pEOxCzRMteaLHsxGxdhMSLmiiDxpU7yALXLsW+y30=;
        b=hULvWy3vyJuZvYcssc6Uwu5DzxpCwIp8IchWwcr73uZ4b+QtOqC46UFN5jmMLDVyNl
         p4dzN8qA1x5DGEf+dry1haz8McfWpnbDQ4xRUJ9ZNd0Q2V1K41pQS8y6Qg0Y6yC2aREq
         q7ocPdQaujaakv8+bgixc6z7gloUdsBPzyVPezglRfjDtiENJyP5exUML7F/KNPjBNAO
         X+PQmnkmh784EZ1/5ZbAKF2GDcj8cS5ZVv9toU83qb8dXGITVt3SAJJE1j43gqi8OedS
         DYizh5adg+7AkWw4C6zNDwdC4LMDpHfFEp8UEh+tI7ODTCSFHQdR/ySzaV5dhEtGbhlZ
         STpA==
X-Forwarded-Encrypted: i=1; AJvYcCW9HAgZ1HrtpnhBmY8UQqHgoNqY5Oa1NWmKIzETtSUpRE6AlPrO4khV+uDW1CvUaAjqIOORvDyIDlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH76uuQNtVkL3Mangf1yRVinaibQ474YaJTbMvfun8J04KmyBy
	5tEC93wYDCFvGgfRXCXBzU9ecpMyRIXyJocDNAHC58T6T3Lj9VkqMYZzeTd87P6G0Z6A/2Fmisl
	1UzMoaPZLvF0O7bKXi4oC3betSoE3wwI=
X-Gm-Gg: AY/fxX6+eJfYzI7tsYIpi2ELvGyR1aZKYHn0j96jg8P9DgSfleEFmaqRDNV2qzdwnsF
	m1O31Mb7vZncmn1qxbomfrdeCALAAZdLbyuQLj5QnEUSpUveEFmqNjuu2NiGc8YS5snXKYodfoG
	2lJDrLjCqyjDLEFZTwVjoWIewCu1Ra6ZSlZO/zdrxc6t0YiM6nwvxe/oTgZq899oDbxV97a6aEx
	/Frvta2MwX/GY8pd+bwXyJggHpPBU6R5RL7RAPD9JMi3swUlLlnId96WFBAEwDh+HFxFCuLAnEU
	9WE3
X-Google-Smtp-Source: AGHT+IEB4QizO116wEGtM/TvDrD28jqsY2fAs5pY5yVqGRRrOxCn4rxhxMSU2ASm78Oy6NPp0xHNiycd8NYhq/GICx4=
X-Received: by 2002:a2e:bc0f:0:b0:37b:966a:493e with SMTP id
 38308e7fff4ca-381216fcca6mr97098551fa.39.1766950605367; Sun, 28 Dec 2025
 11:36:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:43 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 28 Dec 2025 11:36:43 -0800
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
References: <CAMEXYWegtqikPYBRaZcpd_JwQPH80cXhaRK66J8ZhWPrYc7-yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 28 Dec 2025 11:36:43 -0800
X-Gm-Features: AQt7F2rxsR2W6BfMALSzXTLl-v-44B4FmN48vWNaW0EojizGDJpCSEaLdTYOeF4
Message-ID: <CAMEXYWdHGz4mdzc2jc7oSdqQPXLtsKktJfi_MZ0GuQRzQhURvQ@mail.gmail.com>
Subject: [PATCH 2/3] scripts: coccicheck: warn on unset debug file
To: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

coccicheck prints debug logs to stdout unless a debug file has been set.
This makes it hard to read coccinelle's suggested changes, especially
for someone new to coccicheck.

From this commit, we warn about this behaviour from within the script on
an unset debug file. Explicitly setting the debug file to /dev/null
suppresses the warning while keeping the default.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 scripts/coccicheck | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/coccicheck b/scripts/coccicheck
index 2efb74afef2b..8dd766009de1 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -260,6 +260,11 @@ coccinelle () {
 }

 if [ "$DEBUG_FILE" = "" ]; then
+    echo 'You have not explicitly specified the debug file to use.'
+    echo 'Using default "/dev/null" as debug file.'
+    echo 'Debug logs will be printed to stdout.'
+    echo 'You can specify the debug file with "make coccicheck
DEBUG_FILE=<debug_file>"'
+    echo ''
     DEBUG_FILE="/dev/null"
 fi

-- 
2.52.0
