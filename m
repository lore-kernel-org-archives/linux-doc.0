Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC54350A18
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605004; cv=none; b=kMG+AV4ZFatImFjPw8V9HefoS9tWd66l4I6oQ5WPkV8dMo1tJEHZu+nrPm/heDbNQ7B+c7tQFnnJoXNf9HIX+u0x538Pj4xQFM8aB9irXEuNlXflxHJwOCWP8V1dsb6TGmzzvkmT7prNPUJ6tGZCSbEOZO9VIAcdd6a3UvyhVCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605004; c=relaxed/simple;
	bh=BdEA8E7Oilvxl80ZmLNfoHOJO8r51umekHlilh1LE6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UsHwQMmkTri+JZwGQj5qlIezgzXrqxbnHCPE46iY3VpWG+duJNxW8EDrlVolJ3jNndfy8AhmQZTRN5BHbpKZxOs6+kOWYduBd7s8JfFnm9QsGFiq8/5PiWUdhTt4KrLuJnGNKE2346HNw8cj+f+j3qlXGE79I+1DYSMI4xOzADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6AwNtdO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6AwNtdO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-484362f5c4aso2303943f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604998; x=1789209798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYKzgOeBZLaXbTK9FiFpJ1LTahc5Bghrw6NjETh12gg=;
        b=T6AwNtdOyEZvnAumk5TPD0OUV+NhJr/DP5UVQinfpIx66g7lF63Fh/RGyVHlYGhmok
         mPyTDdkC2nYIiuZXUmZ52JPyH3MJaDW4dvMnr1RnWLelTHwjmTy9SpaoE5jpgjJv+UNF
         F48jk4t3yvcvCfXvvbps2TxW/Z6UyqJYZLEHim66y2KmmyKEnEEspFDfEK5h2fE1gAgp
         C0qHoYYSeIQQ/Eyj7GkftRcGsblhiPS/FMaeWaUKkE55YmnY2m51qdVJLuBh2CyQHTxZ
         LS9P2fGp6pGMecNOmkHS18KyhtCS5sJExhRqjpfrXH53EvLzZANGg5VLhY509VjUH/eY
         /mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604998; x=1789209798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYKzgOeBZLaXbTK9FiFpJ1LTahc5Bghrw6NjETh12gg=;
        b=j+/deR2Qe/8BF3C1ZxY63zm1C5Sf/hQAGIWvz4b0MmH8MraX9ifRZAJUwrUpW7Qgzq
         dKskgpPv4Q2DRNOyZVEiOD0UO7zrHJKM0jeRuksK0rbkvP97UI7EXD2jcK7yHfu+lbq3
         G9wV9pJBuAme0HnRw4kwTfLuANUaVYYsKLlOAl21qvKevdhjorOwtSt5dSq7XgNgsLbC
         GbvgcP/FAQnUttI/6oV8tijQKemtu+T2omlhaS5St//QZLrYUCCjbxcZsvmePiXo7hpP
         HujEoc/YkRfAoWdcRXas+wp+DKfZt80J1FTKgB++LIVXpTwxKG9wVKlcsCIgiPJfCNJX
         CWrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz8IEPQIEft5z6xQBpggqcEWieFfdUFYVV+1lQR5vSRqTFKoFak1muagNlbOmX76zbn+T6pvJaxQs=@vger.kernel.org
X-Gm-Message-State: AFuF++mQq4utN/DD3iamsopL+R6PlBiZ4shmIR/sJaV0jX+cFj5J6Iam
	RdbbeAfhjFjCHD1YF6wOv7NsdB9Lz6zUnfNd2k8NysWktkYKzdLn5nb9
X-Gm-Gg: AYBFou0CzV6iqT8nO/xYxtR+bFO77Iu2/DT5GHqLDz4wkQG6BHrhsnCnz3S8P0VHqzo
	uh80K8uRKSZb9OjpVzyuSdKICq4d9dDBL9SLmWcIlOD/9i59YfnLOHEr62qb+xgU9Js93krgCbv
	bMsd/0Z2ysI7ihUNwTQ4eZ/j5bedg2orFTjupb+0ap5rz6lkqKyB/I+bhBYkmynu7Abtja7BkZN
	AK+HceoH6Qz7CkNGttea2q676RKPdLHPtQA7qi1KB09e6piEEFHa1H2VYkF4GV7ZBkaUEXC3RmN
	HBmGZ4REDTnmuTPRTNMDWfELL8CAumjpNylZgNjp9hiJx3AmfiDrWWdhAw/c8RnR93jAGkUrP0O
	geNTkZpDbWV4yYmT+72v6cThrPTURvd03HWVSBLDjWeSwXl4hYhmqXqQ7ED9yDTO/GSKEoTNFnt
	bZ4UpCb/9S3lCmRhnbHdV8x+nBEcHsDMfQ6WHakb0/Ebfir0ceRFZQF7i/z/FWT4sqmX9ZpPm98
	R7m8CiZ4lb4DzF7VTFK7Ke0Hd+Eaap7+Yz8/psJ9BHrWu4RUlGJfgCwvsaBqxQXdyHjnRjDn0uk
	co6j4w84pFjdynGoLwSkjkmAijmAmLfRyt5iu/UzMPRrVBTzIw7OXbJDMxflfxFm+F6cSv2q9Yt
	AFImA7uMibnQ=
X-Received: by 2002:a5d:5889:0:b0:485:8b5c:da26 with SMTP id ffacd0b85a97d-4858b5ce16cmr19044594f8f.11.1788604997962;
        Sat, 05 Sep 2026 03:43:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm13206632f8f.30.2026.09.05.03.43.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:43:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Haren Myneni <haren@us.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] docs: powerpc: vas-api: Use the uapi structure name in the example
Date: Sat,  5 Sep 2026 12:43:13 +0200
Message-Id: <20260905104313.43620-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct vas_setup_attr does not exist; the name is struct
vas_tx_win_open_attr.

Use struct vas_tx_win_open_attr.

Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/arch/powerpc/vas-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
index 1d0d055356e3..00d98cfd95c9 100644
--- a/Documentation/arch/powerpc/vas-api.rst
+++ b/Documentation/arch/powerpc/vas-api.rst
@@ -265,7 +265,7 @@ Simple example
 		{
 			int rc, fd;
 			void *addr;
-			struct vas_setup_attr txattr;
+			struct vas_tx_win_open_attr txattr;
 
 			fd = open("/dev/crypto/nx-gzip", O_RDWR);
 			if (fd < 0) {
-- 
2.53.0

