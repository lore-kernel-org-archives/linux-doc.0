Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673010;
	b=py/cotZnSq3KL/FLbzot6qY0+oHMFub0pqJcYNvA+AZoNPbhjl4k/IwMuym5OO+XNH6p
	 l0t5Vaxs3hTCVe2oCrLmJEmIaDhIn9lQHXCa/t7kiOlChAFOSI/ElG6fyyFqJGJIvcREF
	 Bi6Q8hY/8KkEerHBz18jtb9gL5JiP7WtTjGAOhdK9Do28lZ/I7LpdYNRjd5SYxGqkSxAR
	 R8tgWPzDl5QJA+J4c0moP3tys6eJ3m/xYhnLohe9v5hSkhwHIdbajGkbhU6sWqfq9AGfM
	 VaW8OEJ+bnz4ion2xuT9ElVmIIESBxUDm3QyBMMytzK+RVLBlDjLOqmN/5MCgbRG1ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
	b=yIno9Yvnslny7JGg4txxsDrtwc7O7r5v234uI3XsWBUMVmU3Da55bfEFAyYmDrwaqXQF
	 uU72X5/X7HDsBid475AnENG/l04LspxyZOjS74XGkDPl/sslCl33jS4TIN4haSdKQ6P+x
	 jKmk78sOhciYDa+PiLsnRmNKDIqy0Chuv23Xoj8ELNuHWkM2UI+0Z+hxxzbbss9diud0r
	 0igFYjsoYJ/VQ8gmq+/LJaoa5njjMrk6+UPEaF4laSDU/Q0ei6fnMXI8yF5tRti65MTuo
	 RC4c6EvtBmMVwZVpd6zOqTbXdkkarYJEHOzLQyxG+FV89dyYGFwgP1mN3EzvxTyG2sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1XrLd38;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E4606A324
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 015E4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z1XrLd38
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b9e758c50so3103986d6.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673009; cv=none;
        d=google.com; s=arc-20260327;
        b=E04xvGQ7BIEkBnhsy2NxIhQAsh2j/roZwEuaQPrqHI1hPFH9DNvwNBV1ebbRXu40x+
         h8T1ZhRQjMwZHB885UhHS8rGTMri8fCMRHdn1wdx4sLrblz5uVMIO33udD8/eyKITqtN
         NGBrKEgizkm/5Dob/vetL8UjBGJBseJLi4OU+IkUEMoap0AMuPzXo+nzxUKwuG/g4CEM
         c/9F/H6CnUpTY3X0iGNkxtjqgOdEumcXu4qjBP5MV7SgvQgvdtAciQUFQ/Eemmdqjqx9
         F2PpWBl90f7kGvln6t8bJeWwKJTB3SOx+9mzO8odeR5a6jRy1Rf2kzMQgx9pLZvB5JTa
         VKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        fh=ATlhws3X4oKChHzgQ0zHoCnZWQ45mvVL5t32mJT9y/Y=;
        b=HGACmz2hXDpbVHGeeZPqi1R0EO3Nu8gqJ8l2jCsbavSAVCvoWB1CsDTWjC4VlxkIbe
         j5jZPLpAU8rWn1UXBQ2YCBf0D+ENVT/cAEVk11t5V8iDpqfmXV0MeRP0KiE3/4j8FUVN
         pK7hwmurCn8Rf53pH0nYKGbDAnM3ddFy0tuKNXYZViZUSjsecxO79juQgsaomGnPSgu+
         0pBIwU40ZLJZUzW4C3Kn+KX7cRMDMTONZmg9INPf0O43qOc3vfaWOn6DkRCoAEotqE/x
         h48dMJ8Xy1oOJWFU5HpglV2cCuGoVK+Y5pmoxi2pfxqZvFanCyBh4tYH8uW8LmgRWDi7
         8WHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673009; x=1794277809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=Z1XrLd38YhdY4ermbWFQQiCsCOTTHgFkC2KPtMPjHZOELX6ZCnB3s/4fhteYYqGoaS
         JqTUzWGwrppwpCjQrFaS90de61BcdPP9HNPUmUHJlNA6DTxI6tj8dpI1T2BgndfTP0UR
         GnLz8rYo/MC67spss1I4G97ytNeS2LomlDhV1ImxrIXS1nkmpbM8vJ8+jFqW4GE9T+wS
         bu9Pvq/kJvuRnbE8xK6u+FW+KmM4+/CvZR7U2jO+Q6GLfMBvutc7Ehd6cW67a97AQRRx
         /J6Cd2UQgOQwLXzdHIIIhryqP3RHHgMr3oXdwx8i7UB9mCd6GJ4m2iAHYDxBvziKutFF
         t40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673009; x=1794277809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2y3x5BsFOKR6Xa/PS70Z4WqRPWWkMu4FE9WLs3wjumw=;
        b=23/UEujRwkfOvEotQeV+/MtYh0n9i0BkyB7Oum7hrIDBzylr+4MGtJwElKU6wFirQi
         JGK6Eafn84u1LwTaSvEQdDG5DtTrgqhAhc4YekiiWKCdTk4jaWXLssJ+UKqEfZ7FP7jG
         t0ZPTJLb2406hDrVVpbo/8f/7geC56Zm+ChDKtOOKwHBb998MaMFYrienfEAZPikoa5f
         78qpgy30jrOf+ghauf0R3cHucRAwWYDlr7dqMgghoZ3YzpeUCXsntkeoiw2xj7nWndGY
         dLCHi1BlynEC525mJ7tbZqep7VV7puH/RUR3QtjmUmJkb5qG3KHL07T9ZDpAXNq3ekZA
         T6Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzRlmpDVE5Q7NyXuYFB+oImFHxw0eAjoP2hoCLFj3IHYCptK0mfCdmqnNN12uLzBSFEFZgqEG3Fpck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D53e/KU6sC4JdzB1B2WZZ1s+SwV2dzI7L3oOZjXqkwV2k0SJg
	QYddXgRSiekaztXwb5h9d0vYkP00lkH4hkrvFHUNhzQ2eqZn6HiDUzbo+4nT8eRlwbOVhmdDyzy
	mQjvmdZq6XpWXWOevojjRLqVFHgo/kpg=
X-Gm-Gg: AYBFou2pfo87BlGrjVw+Bwi+jsX6U7pT75/qTxLg2ohJLBQImgXqGAIAwHRlaSAbbLi
	FgPgq0h2Y7Aq+4WBgAU8zs7xjr7R0ttnVkRyvZbizT0kPH1PAP22A3wSM8GQ2Y2fR/VXw5udaRB
	GTZVt7G8k9U8Oni1G5/smR2D6/ISewGkvxN9U1Dm4r8z8eHQB9tMwbYvDecgIcvjwTFXshk40CL
	7K9zn20ZB4tAM2pwJX5eENtwqIH7dXDQCt6zyNHc5HX+nZ/o1GrSH1B2wuTvOX8dpg40l9OJkkH
	fbPKTo/KPVTpKjxiBqDPGkNKdD4LMdLytQX4OOP8RHV2iWBny/lobVbvGVsJbk2q79kjZuBiYbg
	3XmmIptFskAQyT0XDp5jLm3S216jNHreovxz7PlYNmmpmRapRll+LrUcoirFKwn8oS+xCiBa2MS
	6jWI6VXiu6yuO0j6C2lJKyq7koCEYA4AG1wXHZj6wv0Idh9g76E/XRDlZ/qaeymWdly1IEeqQ9D
	2bRVv/5P3hZ9c9SvOi7yOgfOw==
X-Received: by 2002:a05:6214:4992:b0:91b:bcf5:a733 with SMTP id
 6a1803df08f44-91ca4a134famr184970506d6.2.1793673008933; Mon, 02 Nov 2026
 18:30:08 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com> <20261029123611.1108424-20-ruanjinjie@huawei.com>
In-Reply-To: <20261029123611.1108424-20-ruanjinjie@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:29:58 -0300
X-Gm-Features: AclHuK_BJkt9xZLgswfj_Tbr6PqRdG4bSgV7lCXrKm_Oe95ue9Eiht-hTCdNBWs
Message-ID: <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jinjie,

> Say why a bandwidth counter is assigned for the life of the monitoring
> group: rewriting its filter restarts the count.

I could not find this explanation in the diff. Is my analysis correct,
or was the paragraph left out of this version?

Thanks,
Daniel
