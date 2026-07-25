Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A5D38737A
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784974069; cv=none; b=GCtfL3LMF0BU+4jG7Cq8uhRC367oXfMd036GMcnBLIVXw0ZEKXznDvnS2s6OamziAa+euh8QTP89gNJvLy5Skd+IX5Tr/HHQw3OCDXz2XqzQmBaje2uiL4ylr3TBL8mUuPugSjlQi4uUWo70rO/42tz2as/65ITCYmnuTVbL9ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784974069; c=relaxed/simple;
	bh=aJ4LSo/NTaSTwZMJg9a3/I3GRWq3GIZtPlmMs88YImY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHt7ytM0WK3lcUlIV1FUx8vNd3P5RyjAmtX3GSaWTvC/mGih/zcfgQtiDEPwZ8nffeDFSHjHhmXbeyuGReOxuEvJNfffkFTMMaWumrOfAl8O4GfjXYacDLr9AYCkxC3JEnQrdR6k9UkpHt+NqoDRebSf6OzrBjZDfI4SlP/1Ths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFX7V0Bg; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFX7V0Bg"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca00ea47337so522580a12.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 03:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784974067; x=1785578867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psDEako9igS+JMXNeDJWp5ofaqiZnlHSmrShqcd17Ss=;
        b=lFX7V0BgqsIbZAiRYK+9OS6ngz7cKLvJAiklO6tJIoHukhAbMya16UEVaYpl8HrfPj
         dJCfI+nQ00XJjdbHfxUlGwe+0WEbppWX01VjLJqNTGZCNRvbqAnwQqUnlbDcQg5qM8aF
         pdHxmCh/Oa9zuTxHrC+nuhD+usWTG2PzospbMNig3utEErpmWXpaFqNJhCWVT9Nm5orU
         x+YgJ50QZd9UrrNFxl5jFZRUyHnd7k0ovQki2o/4C+8pdiwm5O+KDlgRS/+dR9JrqCJ1
         tM5MpWQ0WigVoGNvQPp5kg9/F3cJC9FNto040qbWigofwuC2Q11N1KPjgpnBNasF3wvd
         MAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784974067; x=1785578867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psDEako9igS+JMXNeDJWp5ofaqiZnlHSmrShqcd17Ss=;
        b=BDmTz47kMIzcrY+L75o6OCBVqlHvxKexYIU2M6ydANWsLHD5IxyO1NmIItG1srh791
         TeUq+Udc4mkCFDOs01DLhv2cOTW+XOmlBbKW6jXq+mlrw5/3dert8dKAhbSny64OpbYc
         VAqsbApt057aQqltC3xzS9slabzVlS+w0cBENhEz2KizYyMpwe+k+ZDtqvESg3q+WBYT
         aSIjeakadGtlq66diIu2P4I8fQhIEqzngCxQXZODMXmZgl1psjaZaLEA5eHm/c945Ftv
         I7PWntOM1OF8mUnYvdFhcYdgqeaHVlMC+uskx9q+DQLc+KI1Atx0Wp/NkBFduJpx1rHw
         n6AA==
X-Forwarded-Encrypted: i=1; AHgh+RpSvAk1MbGrTWrVeCjr4MpYy7CaXdCfi8rFkhO6MRleY8x0Yh0Y8BYfv57BG9m741ZV12SGPVdMFs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEgu0cPKlyNZn1AH3as1N7jFWhFZqi7oDYCzAHkZ6LDRfrOwvu
	+F2cKzc/MWNqO0oHnnovegxVj7wnecKCSOr3XgBqpUfIHNFk4n4XMUHf
X-Gm-Gg: AR+sD11/6zzYcdoMqOIyEMowwFfRvxgzwckX/QhfI09sTOplhsf+C9DbfEey3zq7yY8
	I9Uhqgrq/cgBM9/DZAEXKFP9gC5jfsVVKq0NqTvoQRQ7NBytHvwk9kl+e3fIBCF6Lr5QOe8tYk8
	DcozyuDMxIp4K40iQo8cFI08QUDuLVHh6o6u5RXEWzEuPnKhRYyo3ViGfmSMgmO9mDZw1UmNLH7
	HJf1chmqQcDRwSOsxKWgEl7WRUI8yr0BxwNqcrw+hQdOPU4hGyQCkZjFQssWu7pX9+TZnryChqx
	1oXHCFSycZsGBS0yr1xGD6yxvrl0sY0NqMffW7s2p0L2HeYrlT7HT5jwuTtg8XeGm14TZN8RMTd
	+OmBHZMULYWvwhIGo+9LngXCv6UEFmrS/RpRMLyI6hNfRLrt7MtaAxYueC5N+5EVI6FoGBzjA73
	xwXVJRxovS2B4t3dqsJYA2OIwE
X-Received: by 2002:a05:6a21:2c11:b0:3c4:d47:9146 with SMTP id adf61e73a8af0-3c67e083246mr1684101637.70.1784974067153;
        Sat, 25 Jul 2026 03:07:47 -0700 (PDT)
Received: from DESKTOP-G5LNDKT.localdomain ([49.37.214.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm8840990eec.0.2026.07.25.03.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 03:07:46 -0700 (PDT)
From: Manoj K M <manojkm24dev@gmail.com>
To: konishi.ryusuke@gmail.com,
	slava@dubeyko.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-nilfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manoj K M <manojkm24dev@gmail.com>
Subject: [PATCH] Documentation: fix grammar in description of nilfs2 recovery code
Date: Sat, 25 Jul 2026 10:06:58 +0000
Message-ID: <20260725100658.1705-1-manojkm24dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include the word 'at' to make the sentence grammatically correct
inside the description for nilfs2 recovery code. This improves
documentation without changing the original meaning.

Signed-off-by: Manoj K M <manojkm24dev@gmail.com>
---
 Documentation/filesystems/nilfs2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/nilfs2.rst b/Documentation/filesystems/nilfs2.rst
index e3a5c8977..a0124d22a 100644
--- a/Documentation/filesystems/nilfs2.rst
+++ b/Documentation/filesystems/nilfs2.rst
@@ -252,7 +252,7 @@ The following figure shows a typical organization of the logs::
 To stride over segment boundaries, this sequence of files may be split
 into multiple logs.  The sequence of logs that should be treated as
 logically one log, is delimited with flags marked in the segment
-summary.  The recovery code of nilfs2 looks this boundary information
+summary.  The recovery code of nilfs2 looks at this boundary information
 to ensure atomicity of updates.
 
 The super root block is inserted for every checkpoints.  It includes
-- 
2.53.0

