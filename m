Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8715746E
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769352687; cv=pass; b=lc5bC4pHZ+/FBK4LtXQI0/aK5LQCzKReOeEuIxg7Bzbc+uUOgVZ1BMqxr3xHTtYhAWnkymT1EQQO1nzX2Mu2RKJFixYiarIGgCyfxNiV+Sz+QyD9OMoJ4RHdX9qgk8EmA7Vd0nLNXy8Px0c2LRNNYlG4+9SXSytRDRhDollGBpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769352687; c=relaxed/simple;
	bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rTNFWXlCk2zYZy2wwhbgj0TyGCcjA4rZavoAXJ5WrOKVVbpTNVyz0fBfSScIWR49q27NMy1NpUZ2tajiTNDN/PxFTenSN2+9nOQobfWwrqtOGagX9FLnN7FWbSvYFR/5kznMApVguJheHplY6UKPFB3vjNjMMr+fIExGw9/pErw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxgwm8m+; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxgwm8m+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso39566465e9.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 06:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769352685; cv=none;
        d=google.com; s=arc-20240605;
        b=dE1i5hUMdvx4BOPLnJTeNdi8IslIWfgPxe26i8xxfu1tnvcM492GcGc4Gc+8qUGZUZ
         tGnnOl5yRZiA367PJKdM4caLkgjT2fSzqZ2EiGyz7gApnSpwocmNCzu2N5hBrzMrfRJQ
         t6y1irfYCUDRJp8+yxi6CQHVrg1zMYAY+0GW9iFziNL+uPo10avU4w3YPAHAF6JEtDBB
         oLNw4sgMPfJviAX9/decTBKu4jiBE1IGylN3aOrJSkhVQVOernQFd0uZFawqQ3qvZv/W
         +UjFBjFs5+8J7c6+xorc179/El/69ulKMgVPR/BnmFppJbZWIi2LhjIu39BXuNR80UN0
         Dbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        fh=gjXLu4fPltAWxUijyXdTZBb7VXJirANJr8tFBEo2ozU=;
        b=MkWAaSA7Y13zlGuDRcXrbx7phaofUZ9Zj0IYeTUYfDWUY0jgvtIitFSItPG5DbPVGD
         swY15cDb8UMRTKfnjAvDHI0t7nhaAUfFlrk3ZCQbGzuCWKVgGjoTCFnoPLrgYD3fFQvi
         78qwoxBVVXWNQD+9v4hU2EMlnOKYW7S1bSKUr6SKTalB6Pj4+fHXIgcOFDX3J+eGAhN0
         YVou70VIgixQudgOiQfWQC/wehKwYeejk95MkwZIBmgOKALxl/ZQsiXKqbi8rqZwDRGd
         ApFnilJ/2mQM3nn7C+DezZ/v9V/FXsMSYqHTsVct/o8fBW3Tey4GTMlUj/62wED4QhdY
         aqUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769352685; x=1769957485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        b=cxgwm8m+ZJQ2BtyAAipNL2pU5Fr1gbADX7sHWQn3M6H1KySKZnkeRqMC12FjhGZPG6
         pvC3gcNGwiDPwyh7HAvJxUYD81mXua2pj/WNlmnqCOenBaLOLAkmiFmieV400s9xVgp4
         J5mdXacc75ihxX76Ii3H5SD0q4ougXu09b0EDAH34RHNcdgxtUcNXkL6jzidc3yQ1B99
         zr2tdFRpmMg6VMUh4ctBviOffOSc5DuYCdZSLoapaZbztn/UxV95cCPR75T978nVi8pD
         hLHzqctwyx1AJbVn6CHC0HDpdwGJxXsBgFf8ZovO2fhOCuYEu62gh7pXADfhYwBT2E6C
         01tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769352685; x=1769957485;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZZ5KJFMykGYdGFWDrZsTwYCyWYm5jOchGVm19FF268=;
        b=EDEwQgSY1rqkE2ukSe0THwqLBS+GSw4qQGbgejb0v/MsSuzbGJzg/GmuPk5GBZK/5r
         rqp4wXrD4zAu9i2UQn5n3yR0Ijr0Nb3iQJNwLv5+AvN1LC/LbwASLEG+r87FZrEN0d0n
         jTX4QOUxiXSL2fMcivYHQmvjZi7qFZntrWZJnirQSyRrCTRrWslcecExDxse99n9JLJ5
         hgWj6mXS9XJlMbzmHBSdYOxMjSrHEi33WOU2TgfpirrG7T8nmjj++lkqoSLqREPFHK+s
         8NeDzSUH2jOVhujzGlfhaNgMpUj0ZNuHEcf6Li2fE8+qk5TJ3aNsISKVeWFPIZIsaVlK
         clzw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjAHXNIaxdgNXZdQXyxG9Zi0W5ubMXrFnygL1a6TtqxoiSrPWUJzlYWX/cB82Lup8Yxs8+UcsaOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuNzg/tmvAmJlGHPsaNyCAfyWQI7Z0m/CR3AwvMAfASpQ3pPfL
	ZsySSfMlH/JOM9JVT1I4FtzEljegIbYUTijV//7hRMOVmGcbQQkXDcA6SYt1lFwKnYsRPOia84K
	o/jC2OavT+Dtc0WqoqF+R58mwsIR9CJmIfE2uw6E=
X-Gm-Gg: AZuq6aKoC4dqVlvocimxD6YSZG+Dky+/7nJicv1QY2kfTbhEugEhPj8vG08R9QkmhFy
	nEVAslAQvu8lSImi1CQ5A0iS0xWXvpgTEGhuM+YnlSpgWvwWCRP3V24dL6Nw6BxzDCeZek7C9HU
	4P4QqJsYjf6XHSvtYIw5mj9v8s+jenyGcgw5HgUGG4wScqT4mTSVuEC5Uyt2d9RstizGPrdBDQY
	VsJ920iAlbMYyGFm2u4NOlgqvBgpDeT+mqF9/7IJtSfA0IOGFW4QOZg1KrwKxzxVjVgeQIu1khh
	EPIAmg3cPrV8ZNHj5Zaoh6iP1T3AaA9wGv5WMyAwvf5DE97rpd3yUsoVMQ==
X-Received: by 2002:a05:600c:620f:b0:476:4efc:8ed4 with SMTP id
 5b1f17b1804b1-4805ce4e4e0mr28495065e9.11.1769352684518; Sun, 25 Jan 2026
 06:51:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: john ashrith6 <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 20:21:14 +0530
X-Gm-Features: AZwV_QjoXML2HHu52yvbzqau6LTswwbhMRy0aDi-ka4UT-KavkL5Eut6wcwcOK4
Message-ID: <CABoKZAAgzFdYVnKLCyU18z4JMkJDH9K1dz0LLvr3iVxhiVYXaw@mail.gmail.com>
Subject: [PATCH v2] docs: clarify CC list guidance wording
To: workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Updated the author and Signed-off-by to use my real name and removed
the patch header duplication from the email body.

Thanks for the feedback.
