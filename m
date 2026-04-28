Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB223B47E2
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411051; cv=none; b=pBmVnkMi7CQpBY3im8w86qhm8gSjuqSX7wV4h+8Fqkc5CBDPz4iPNRm0yoIwR9rz371KpfqSLJvch1JZ/eluaVQQiXi5sYV2INIHXbZM3Dp3DV6pH4UPWm4OcitbAgnglv+dEsY0/X9f/twpAzbSO2XUCc1GJu8zZBEbiXQo/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411051; c=relaxed/simple;
	bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEkxd/TQkv4a6kALHteuGMFq62t4SQp3XtJq1rMBLWdp1bzxIeiMEUWALTA2oW7t1hw/+8KVQ6+eQDZ6adOUHQ7YD/hZMSk59WtFxalvzunTcz2fiUXEHzQ3YJrfcfGoIBx80uegUgAJHZGXvaehDyb435TM4Q4n9o5pom6o2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2hEylld; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2hEylld"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b150559bso93424635e9.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777411048; x=1778015848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
        b=O2hEylldg/Ld+MzaVzqtaUAL/E+9mDjaD8SfdcUFN93Yd/GlrMi8GkFKPNq7cXWrU+
         YUfmU+K3zGRdqDWWUbSuyNgmiMSvwy4PSmNuvQdPWEis1ltlx6E3Qyvi04D9eubF0iM3
         zp3WHUulwJzERtq0/0vU2TUOBwoxwvud12xBdH2GaksSfpOzItAJfMhe3GE/bg5AvIjn
         mmkU/zi9Kl+csNHdvyFQRIsZgicr//xDR9Ro+czErsnZ34USi4SLhd+gqKhACUL9B9th
         ht9CbGIlLNPyWRrO+xwS/P2oYqWy57vIGQSD+hrWfUoziMecdblAt2Mljpfcc6JFAOwD
         eiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777411048; x=1778015848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb2jXumaQ80Hgko/o8kMeVGtw1AsX2y/zyw1qfL+Usw=;
        b=BRWT2E8H+/+C5ck3+VBsHzIqEAPFQGCoe0C+pQwS0UsPRJ1ZLh7WXn5GAh2OVYZvM4
         YkPhDRGTdg+Kv+iPxNvSs1SMqbNFehhCJE7ZZy0MpotibWFFHxCZqU08D/ypM5lIy9kv
         BCJwteSE5k9jqGOzRTBKBA6gRJJCl8qMfNE2gVT9yc7PcNP5xULESHEwTPBGz1rJZmvv
         Ycgi7x1Gchja6uNHnuXsT4k0DTvFUioa3u+mfvJRdp6qnUNA2psrJqE7WR57IvGenIB4
         2HT6fcdfmkEUUyw1N5XnwLtrir78iDvwFs30tE8GdRbhlZ33O6PTzMPKxi4n2PNPqehM
         8esg==
X-Forwarded-Encrypted: i=1; AFNElJ/i0YJGP9yBsqkLbv5Hkb/c0mQ/HtcDHuO91VFHXLo21mlfmfkwuXZMWZAnJCM/a7i09ug5+QKksFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7VW+9ghw9v2aZb9h4HHFvMo5vCugux7tpSLTkVYDxYw2bMYT
	vjWbF5NxtCQGisu9Gbq+yJ6yr6WElQDFVIzUcpcUgK/xKNHkqKtfhTrn
X-Gm-Gg: AeBDiet66MJxFtqpXJKaVmJdcw45iG+L4EBHvU9HM493WkOPntxloBzCBRRy/sI7l0R
	5nX+JtrOWzzRZDzYgLtjrvMvI7oozhnV1p9MGKdao0VRoIOoHLE+YhoRRJz4Wlh23sQmlSNpQzC
	lAyB8wHxU4YPwzkaNSlgPRoIG595qyc3aRqN8v++nVecb6rzpTLO8EkHCHUtatuQ8IeDBQvd4xN
	q4bOWB53oUC9X85aBs3EC+dcmbxUIo/qSmYBEf1QbWL9asdjQ61NHbp6u+5wgLN+wnUxSibuZkW
	Cxlx+JJIErJHp6zyS98/hiZE3sGh8FZHil+A2Amfl8ONyvgfkMsgKhPlAIjC5446XCHhoGPWVkg
	K/gBPu5uDeCEXB0kEWoG2z7roX0VwLp70Y7siOWjNCWtJdCmWkLLWMhJlW8th4tMTy4/PeznA92
	ZwLpkWajvXn3Doa78BZIv7n1LnUSpocSR80/gE19HRp7m7znFqP/aeIuZWjmF3G3UajNLYzQ==
X-Received: by 2002:a05:600d:10:b0:48a:56d5:16f2 with SMTP id 5b1f17b1804b1-48a77adbe5emr54885485e9.7.1777411047872;
        Tue, 28 Apr 2026 14:17:27 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8c20f7sm7477795e9.0.2026.04.28.14.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 14:17:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0751366c-2aa6-461d-87a3-84309f3c4735@gmail.com>
Date: Tue, 28 Apr 2026 22:17:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
To: Greg KH <gregkh@linuxfoundation.org>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de,
 masahiroy@kernel.org, nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
 <2026042727-delicate-genre-21fa@gregkh>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <2026042727-delicate-genre-21fa@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026, Greg KH <gregkh@linuxfoundation.org> wrote:
> You don't say what this fancy new tool actually does anywhere that I can
> see :(

Hi Greg, apologies, I wrote everything in the cover letter:
https://lore.kernel.org/all/20260427174429.779474-1-julianbraha@gmail.com/
and then I wasn't really sure what to write in the actual patch
messages...
I'll spend some more time looking through past RFCs and either separate
things out, or add some repetition.

> Did you mean to check this file in?  That's not going to work well...

I've found some ways to significantly reduce the size of the
dependencies when vendored (also thanks to Arnd), details already shared
here:
https://lore.kernel.org/all/d72badf8-7d70-4caa-96a9-d77e00bbb536@gmail.com/
so then we can remove the internet connection for dependency download,
and the Cargo.lock file becomes unnecessary.

- Julian Braha
