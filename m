Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319C176238
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996238; cv=pass; b=hX1S9wwDLRNYwPIbTpoR5L84oOSrxykikZzLe6LgU8N0mLY0PhDX5/EFAVBdpVd2HNZTq00ASK5GyuVthOf7ycIM0mD8ZGmT1IoXtmwTskdWkZ2RzGGONhJPoqKltd/Gr62cgcWsS1ONmUeERIN9O9Qa+svGlSsqzB8vchpvoPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996238; c=relaxed/simple;
	bh=NBwdpoxYbojA7JRRVvOCAk4ZM9VCfadWb/Pa9KudS8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kuiwo3vKPyWVLyYLulbYd/qqTBp+Z3wJFoXBONyUi7rr0kjnT67WY/wWaqQJp2dWSxde7imEno36xqYHR6M4jGUZuvjwzDrO1aiyD1XMlGAveI4ijyC1W64kCrm5V4ZNyr1UX4zKkG3QDMiF5aKT8TMvkVIPtlNQJCHso0kH4tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rvuiGQIX; arc=pass smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvuiGQIX"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2caced6038eso6439595ad.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 19:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783996236; cv=none;
        d=google.com; s=arc-20260327;
        b=gdPdRToFcxJF8F8kJjICUKX/AVrYCuOMfVK3zLeAmK4dOS4EdaC1Ya1zn4qVysz4nb
         z9e7APvxTaGQPtMIalB55SoBxXV6HT0hK0u4B6SjlVFWWQrqYt817NhVE+aBvqdVdib3
         36m6V2iXhR0IeoNZoC4nsWOMKP7iIIvUnJjjBceUP9ImjCpJiv2tP4F7rKIdApt+JO4f
         pAN7bf8O0YFiWCAFoQer3SkO1M+kYAXxinvyEBlt8RWxSNK05h5MK3Tl+LGQdp5j4nkB
         KUEM+SCgE7NX+0XhEKU9PL9P8zvGEKa7w5Wlc9w9qVqPciQ3Q0eUGkz7vhnYN38alhn6
         u3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NBwdpoxYbojA7JRRVvOCAk4ZM9VCfadWb/Pa9KudS8I=;
        fh=dhU1xm3hm58lHdzEF7xXfAJA+IalefYl3GuWxQywfDE=;
        b=iUTO5ZdjBlfwfDfXekCeGljeTL3A86hBpnXTHfUpFBD+yzEhZLUXL45ZQz/55ivzNZ
         qpuATvzKrdMz/b1wGGEkY/i20S/TgKPXKhnE6x0JBdlU/NoNha1dF/4g3smr1LEXC3cF
         hkyObASLzNClydPCF6/JwtaZF1c1U+JpcaJQDr3ie6t0JuZYk1m6z3gqjxHHw+oZmAQD
         uD9669oU10zxx9nar1YCYdDL86TpSpWWw4gqu02c59LLgyjCfdYBdqxUVLgmNRXu68LJ
         ifkZvY0oXq9umIAM2TPfIBZ0vxskpIq4aMNDgVednSIQLk+eZAwTC3eyezVTpk8myUAz
         lO9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783996236; x=1784601036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBwdpoxYbojA7JRRVvOCAk4ZM9VCfadWb/Pa9KudS8I=;
        b=rvuiGQIXGg9LXhis2/uQyapzvnKEHWuJwveYbOV1F0c+5AaRbZ3EUlrykhM8T3S/9l
         nlkF3RYfyyk+ICFbg839FM6ONGZVc7gV1r/aW3xZTd5tKaJhOp/w+w4BK51Wlb1vd3jU
         m6fsibeS7+ZEAWWk/bDPUAaadw/NXayBeTNOXMm/42WX/dT5QGI9UB2uyoyuM05UPwkS
         0VP99GyW/vFy7QruZESQNXzdb7yAsnc41c+ubgpLOwV8ipXPiiOiG/8lqX8QuaPV7KNa
         54DLOjT7BUH+yjG5XfVXucNSKyt+d/D4IMotr3It5hnGgrC/OWcj42jHjudAzrJrpZkC
         BSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996236; x=1784601036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBwdpoxYbojA7JRRVvOCAk4ZM9VCfadWb/Pa9KudS8I=;
        b=poKEibjD2YvIZPvJUe3KPzuOcJ5MRn5JV9smUgUfGdMehQa6oROcnaOY5IT1Rgf6Jd
         zdYIVhno0T790yXt1U9M9WE0oL2IKE+a+ghtRTrTtp+AGVB5ly14dij6MURHKFZD7VIv
         VGUkCy0QvKhMGqXB/mC5W7wfnVdPKTpJy0oRg7Ny7pZFXIjh3eb1FyBdSLylwKfFGk33
         /LjOWiZvkl/pDk9xb0ACIrmrnPzC3mJFiymsczzMinYMVEEBNEzBDnZaE38fSH+JJPHL
         aKSB1jbfKH7NKami7xqqcVN2j+nMbgUQ9hqibGG4FoO02qeTDPENQ729RBAydgX65Hxy
         Muiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0HOcpLIoRotp32B+nFCp0uYxIW8l0EJNkau5GIpj4Fh2YjuyRQCIGOmReLlh4lrkI2JNCGqu5+JM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyENU4UZYu23a4+/TzXtNlanPLJ8t0OdOzhOdoxtB5av9z21Sxk
	rGNnrpom6aJiPWJM5ddhJNPcHVt/Xn/xK+SphXtlEAlsoYNf7V6ujfAzY+7b8AoPC+bcsNwriuK
	Q7DQHaj2HR6B4qLLO4QeFlrwcpcVTpUs=
X-Gm-Gg: AfdE7cnx/wGqai7owJeHvGL1uauKv7sPp0FVq40oGKuGN5nRcs3R1ptYpXP+fswMOh5
	nnFttmpxto+ZC4r9ItOS7SB8BBksXJ2jm91nTl9R6nnZBNU8SbUIPCscjmTJcPJvcx/f5y0flAg
	RcWZ7jdpA1IZZYwSuN1vwWch0ecEXZ7ZbrrEntOpdvluDroVyMAudU6pbHFORtak5wPGwOlxR2v
	DbdhWTlrxd+asKpZzme7l4DqyI1aKCdENlxFhFaQVARdgyAU2g7pRrYW5GW4aw5JardvlretLs=
X-Received: by 2002:a17:903:1b6b:b0:2ca:5023:f983 with SMTP id
 d9443c01a7336-2ce8298a455mr155911055ad.29.1783996236518; Mon, 13 Jul 2026
 19:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alUXH8qRRjno2eZG@wyuan.org>
In-Reply-To: <alUXH8qRRjno2eZG@wyuan.org>
From: Jiandong Qiu <qiujiandong1998@gmail.com>
Date: Tue, 14 Jul 2026 10:30:24 +0800
X-Gm-Features: AVVi8Cd-bh6G4JGpccRhlRafvWbDBKfKq20vsM9UlzsZK-bImgQ2v6sFC2ypKPU
Message-ID: <CAAJ18eFxjotuhggQ=wkSuXfyz5yVHE0LiP26STdcJwfdwAfF5w@mail.gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Weijie Yuan <wy@wyuan.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>, 
	Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>, 
	chengyaqiang <chengyaqiang@chengyaqiang.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

This is great! As a newcomer, I often wondered what was going on, and
worried about duplicating others' work.

This kind of summary would really help newcomers get up to speed.

> More importantly, it gives newcomers an overview of the current state of
> the project. New contributors can begin not only by submitting patches,
> but also by reviewing patches already posted to the mailing list,
> thereby learning how our workflow operates. This may also help reduce
> the review burden on our friendly maintainers.

Just a thought: zh_CN/how-to.rst currently focuses mainly on submitting
patches. If we want to encourage newcomers to review too, maybe we could
add some guidance there on how to review, what to check and how to give
feedback? Curious what others think.

Thanks for starting this!

Best,

Jiandong
