Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDE73C0A0A
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370067; cv=pass; b=F4K+2B2SiAmhVUm/VqQTebZ9K92PGwcWxhNyR0rGrtxHfXABJpKsv8zwDA4V79bCEHRgi9dvNd15w49aP/BR+aWmjz76wnGKOkoN4WClDp7SqQM4EH5vp4KKR/5sMwlZSUAyL9HOcuvby/hI7UdC+mT1mQw6kMQ8R+KIKTxHNTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370067; c=relaxed/simple;
	bh=tGAWu5LNtpJWSC5IBQgZeW/uApXDPJ4ogq2A+M2loa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLQfX+334IvRBUdlU9ubIid04J84/uwRVDSfj5OBgT6kpvYSbLO1t6c8uY4yc5do0PhudSlSu1yqseUwnke/I4xY371J9YNdZiTIE6cg6rsPy5re4CpWj/nyvnCeXEIXoCW/YTtydqWDRXiuL5MQSmprf5cY9qQyHZEzOH4no4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGBydG06; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGBydG06"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6646fd19d8cso167359d50.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 23:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782370065; cv=none;
        d=google.com; s=arc-20260327;
        b=aON54/fZlQki9/Wm3yd2xApjF4OdSB4BFFiLB4Hcvfn2mWZFB8wCCPTNJisDLOR4Cj
         Sy5y2jyYRawP1zOUy3o+u8RmXXWLUvflc6eP6AM5xCOFPIUoJ7V7xoOLe8q43htqdfUF
         pa7NMtSHAGgLCuxTiEn5i1G91BUM3X71Uf8iwSPYghH2/r0TutSAJD/f5oO1COSeLDXH
         /kyq6lVqwSZseyMTDqLFgMAkeqdRUqqH4qsrCwFLRdLksRCr2NllEuUi6L35i2FmVRAW
         zx9/sy3hB1dxEERbG8Z5mh263LG30pwFnP9SI2Xhl56pmGr8tGAEIPDT1Nc9Nquk9GWv
         /18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tGAWu5LNtpJWSC5IBQgZeW/uApXDPJ4ogq2A+M2loa8=;
        fh=/MClHLeVoLIkucD1eKmpgnjCq7g3tWPN4QGsSI6qC0w=;
        b=hY6waXw3fMMQJVpzOy5vKTsGer4aGotujOBOU4soVvety3W/DzP2mEUhl6puDQb0um
         fpLFGznSJTNmvo39nbfvtc66tZ1+bTKuWC2KFW2kO4bnBbaQCKZqx7aFRd72Tcjr5pFb
         yIvvIxTUU1xtshrum2eWB1R94wPSb4tMCx5IhSOLHt1GvvPShSzpw0wDgtfyJQ+atcGW
         PeJ0pwJBF0u0wX69xZWzK8FISz/5hoSMTmIpxKN6UvWyZpsJ/I37WfgS2Mr/AGWnoRFW
         PjzV2vSbWQB8UePM3iMHg//H37RF6FWfoQK6La1+CUHbLJoDS9n6j5MkyBQVTsUffGQU
         Uciw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782370065; x=1782974865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGAWu5LNtpJWSC5IBQgZeW/uApXDPJ4ogq2A+M2loa8=;
        b=aGBydG064pIST+4w5GmkiitfICKCzkgLGlWyuMVAO6IelG10ReSqXJ72mr/4OSsl6J
         NkauIRovypKq+l6OGuGAWTq6FHK1PAcJ+GiS61EdbwQXqQNvUK3AkVuavqPGmG+gLuPw
         8gsCR3SbYfp7x0fEQB+S3nu+0UtRFw1FqocxqKc15v3gVwGhrdJzSqQfQdPGgF2LqZ/l
         p6XnDfv1Ufwv+eOiEPgFwEggQseouYXQWQHZxGWPKYMKe4cN5Onb3hHv37MkjcCA1ry4
         lmp1eLsUQvhEAQCcMFTGWgWCUE+cdOdrdjgn6+9ffkndv9vo5Ved9HTmaRMX6R7KZLnL
         /UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782370065; x=1782974865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tGAWu5LNtpJWSC5IBQgZeW/uApXDPJ4ogq2A+M2loa8=;
        b=mrd+uWpJPs4NUUyblrzt+WSd1iBApWZ9nUwub1cJCeEJZ/ymp03MVcgnxOlaMSU6rx
         cO+7sJJ8PgPPNn7Tbw14oLCma0e294upfXcrU8iQFsgT+Ldy2JrcOgx5il95/aytMFyr
         4bAZuSKqNOKzRD2pFjbsqpOpt40Xju9Gw6uDZsLORIenkP1ZRRo2B7VXQxCxU5yVyG0N
         TYoejmY/BPO0Y5ZrA6dM/deNMbyEQ8Lc4BBMlKo1/kWENBxBL9P1uvEFCdQxVriJ1RD8
         Iz9Y1groy/MATXz9m26d4QXoUMP2Hqak5z0RXnFov7CTusv1yT7l7hR412eSS25IklzV
         5Udg==
X-Gm-Message-State: AOJu0YwQblnmYf7oaRrcKGzR1ywv4hjjmKT3pG+7XopK68TK+SkwpIV0
	SYKOQI7BkB2cu/ZSfwId93SYfBK85ylHgVzuBlfTdsJWXhJhX77pXoOstca4B84X3TmA3R1zToU
	DM/d0xd9n5IjR5ZQRCo6AR0LdYEiGxrtQ0L+wbwU=
X-Gm-Gg: AfdE7clcZDAb7yiv0+MrR50GId9tTnCI/Emizmu7mhH2cHneD/QE7wZAmolN53u0qi7
	fmTQZBnME1cF2B4VNRjm0ISSyIYuwPwVNCSmnQJKNvH6Jhg6sAKUQHCFw1WyN9lGzaQfVqwAiFW
	bJrAN8EfkM0OhKmMDgqQCFuYLD0MPbtHr5oURtAYlzqt628wHQ5gGiZvvtwXTNE4u8PgtaURtiy
	/X5DO4w3JApzC5gbngOx3VUd39EumVp038zfoY7Z/8btmu/aEsKCJNc6mvIzRgwiSVzjvgctpa5
	GbBMFG+eRBNRrIu6jBJIm5yK7qiPcnUR8osNIhg1cOWqkU4eDMS6qpAm2pV+Dz4UmEdSmD58
X-Received: by 2002:a05:690e:c4b:b0:65c:27b5:414c with SMTP id
 956f58d0204a3-66487f1656dmr607476d50.5.1782370064940; Wed, 24 Jun 2026
 23:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617085305.3205822-1-doehyunbaek@gmail.com> <zJRp95X2zpOwl0JF9O3s_dQfHMeozA4ondxH1RSqBj9KK4jYkV3pWJpNwavq6WlYNbGv3BVBxK8jyc-VhlU62IlfBVhFnGQqnkz71efYe2w=@vaga.pv.it>
In-Reply-To: <zJRp95X2zpOwl0JF9O3s_dQfHMeozA4ondxH1RSqBj9KK4jYkV3pWJpNwavq6WlYNbGv3BVBxK8jyc-VhlU62IlfBVhFnGQqnkz71efYe2w=@vaga.pv.it>
From: Doehyun Baek <doehyunbaek@gmail.com>
Date: Thu, 25 Jun 2026 08:47:09 +0200
X-Gm-Features: AVVi8CfayxQ2R4bVhudWME9A6GBL7dhl1k6sB3_delgNXQgxrS9rhFhw2eF7Kpw
Message-ID: <CAN-j9UqSuCWikosJzu+kcU=cOwnfRzYkr85hXS24AqSf=qwVwQ@mail.gmail.com>
Subject: Re: [PATCH] Docs/translations/it_IT: update current minimal requirements
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Gentle ping on this patch. Federico replied that it looks good to him.

If nothing else is needed, could this be applied to docs-next?

Thanks,
Doehyun
