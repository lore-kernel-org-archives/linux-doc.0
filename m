Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6823845A8
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531495; cv=none; b=lX+VRMHIeIuUfkmtGjSpBZbe6Wpyr9bWOMAZSAvbeef5IiEpO8CRTvDzcdh+Ehsd0LwzXSbYpkG1Qk/tMU8NkCnAFAK5c9gop1AXR4Cz16UpDy5mEXOVWbzMSnsflLU0joiHW42pZcHukaYCwMc2eSdjvFs3bRgxcZHb/5AeBbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531495; c=relaxed/simple;
	bh=eQWYO3+SwZYejqvzTN6BV1VIOebuLicPpMq0BuowReg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CT0LXTjDUEU/GJxuLFA9aBO/oYUEbOho6zFsvv2YGrb1tiufglOpHwfIrBlvAs2+6HptrqeyRHkHr1UtT1EiRRvwJrf7s2rjtLuOYWxIZqKqSHUg81Mx8c75oUWcjnU75ZqxmKxMAfMoOtRLi712nw0PBqNFpMr/Lt/Qmb4elvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1i4wHo9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1i4wHo9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c70c112cb61so3117114a12.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772531493; x=1773136293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4n6VTlQ0XNkwMjJxDJ13uqwgxr28QV628O/CHdeaj4=;
        b=U1i4wHo9nQLPyjhYYbPTHlBbySMMoLwwBxUKvIdNWQ4537/GUPNVBc7UWLpRtLUePt
         mgHqtpaODUtukSsRS2a9SMsOj1SlOxoVvco96OFSnZ7mKBR3J0Z0u/1pLh5YaPwLt5IA
         kOBuKN1ZFbsLHB7W+yAR1q4rLKcNIyIWxgM0b87bpp+bvIXzYDJXSQG1UcfT6RFezppq
         JxXap5winLLapRiNxFWwUtpexnqhelZob39sU+NqLTOS56ykvZn952RiV7RshODI+Kys
         dX4HRldWCuqD2ptbgZ0YHMP4w6qC6M9/9hFOI8SVrkXOihQQzfWJluPusNvbUorRUZiZ
         YRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772531493; x=1773136293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4n6VTlQ0XNkwMjJxDJ13uqwgxr28QV628O/CHdeaj4=;
        b=N5RZOJFMMXEFgw7KBCK2/pKF9302CAxwW6CIiEoW/MYEJzItlgg8iOoDdV9Hm9SwrX
         /eFezVBp1TFXLybYg7gXpOI7cvTqVQJM8ASup0koH47DJDGok4cChNo3XiAOGTW/ra/L
         Vz3YinzKeTzCuUdwLO2gGsEKC6s+LZ5khemskqrLBUIfQNG+1Ud9SvsNwNaJtMT2zyy5
         zEVoXKYwHZ+/t2Xtr9yGszQrigZ7eDqmksPNQ7PtOnP7XTVTmNO7KOb5HV92wls0lRjY
         wgwNSJPlt8gU3EqMiNBefE8AUT0kBdyLFGR4OlZ/MJPjo59qiM/Ff+zqeIdPNecc6f5u
         sk8A==
X-Forwarded-Encrypted: i=1; AJvYcCU5cwzNavKl0bG0JkCGIOK/ipifIfylgYbVDtekNGiycheFPtTQsT+TW0uz9V+Y7Q3rWyRtufBNwKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgciVbIkhoKeg4hwzwHFEDkmJTgPIKTIdxUlhuHZUeOOV3Oc+n
	EfgD6rVCD+CkOCNKNc+ZJDizqBIol9UZMLEaL1nso8KubzjPAy0TEae/
X-Gm-Gg: ATEYQzy5cMJtVUnz05Drai2HjkqVmORzK9z79s/P43bBmNY7HbizEE9NKJv0tZPlWf4
	MJh3AhtnhlUOKzX2SnmVBfmjm/wGvjM0e+RhZ/qE+oJFEphL1f6tYN8sc77Ghzk8tbLOymZ3oCn
	yzCJxE7aIeiMOkGvHba0vmwbuurLfMAa3c3JTT2wDZWOXJRokcec3Cv1a78WUswxbnSJQWcU81R
	Z2ox9BI+bay8E70a6zVPT5Ef+ve4T6VLjpxH5Wvy3Fs2isMCwDsd3QFuGVCvGHmZZeemqENCNCR
	fLlpK89HSVx6sJIDLyejNu+7SocFV5kjIhr7ZtLmYOl4HfGpif8p1MqekqWX12W8g7h2gR7uXAP
	o/vBDMKqFg9wIfm0ywZ7QWBvg3icqqjkP2fDXAcKerTmXKDyYFN3s+u9bB+pjJDvyX7tz000M52
	uExDLk/DsYbkRA40ghE5QMW9chWDoMJNzaA14lJrf2Lk3RGvPPV+K0RNYqdCMWeP+AccUi
X-Received: by 2002:a05:6a21:610e:b0:366:2341:4980 with SMTP id adf61e73a8af0-395c39eeae2mr13921679637.11.1772531492612;
        Tue, 03 Mar 2026 01:51:32 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3a9baf93sm103562865ad.27.2026.03.03.01.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 01:51:32 -0800 (PST)
Message-ID: <56eb6125-3031-40aa-af94-2b4ad5787966@gmail.com>
Date: Tue, 3 Mar 2026 18:51:30 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: ja_JP: process: translate first half of
 'Describe your changes'
To: Akiyoshi Kurita <weibu@redadmin.org>, corbet@lwn.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260225154706.5457-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260225154706.5457-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurita-san,

On Thu, 26 Feb 2026 00:47:06 +0900, Akiyoshi Kurita wrote:
> Translate the first half of the "Describe your changes" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Replace "説明する" with "記述する" to match the distinction used in
> ja_JP/process/howto.rst, and adjust line wrapping to ~74 columns.

Your line wrapping still looks ~60 columns to me ..., but that can be
tweaked after the fact.

Currently, I'm kind of distracted by other issues and can't do in-depth
review promptly.

Jon, I'm OK with v3 merged as is.  So,

> Avoid cross-references for now by adding TODO notes to convert them to
> file-local references when the destinations are translated.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Acked-by: Akira Yokosawa <akiyks@gmail.com>

> ---
>  .../ja_JP/process/submitting-patches.rst      | 44 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
[...]
