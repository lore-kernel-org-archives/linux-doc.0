Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F9E43786A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344090; cv=none; b=JxRFFGTJT2tvn1zdKtGFHH7Mt5G27+wWGesQaUILuPZJEQuusRYoXD4SV/pHoLQ7VxARBo8Ply3RvuXeJ9XFn0t7QKiuRkxq1qWASla6lpnGwjTEm130gH8tg+gclrklFQ+P8JoKPB4uL8hgb70EW0F2t8yKSv+Q/XueQM0v9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344090; c=relaxed/simple;
	bh=XSZO9oyw9t86vddd9e2cnXRvjlbz/kOUaStHlHK7yg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQhayzaDbNedcwwGjs+gqvLVAMw6aAVEqtYPIVRD9Nkb9uuq2Ym4VzLbPKBM5/v+Rgw7pMleAhDMRrfNuvIlgyjTS43Sk4BLqbAJRvzo/xuruXFqvnLF0T7T+Sd5Horxv31HiqihoW4VntnAy2otr8y6iEtKRU8Va/VQJ4dob+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9V79SYP; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9V79SYP"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2caf18d4903so2084315ad.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783344089; x=1783948889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1W8mmlgvH3ozoq6WKj5bNebnoD5x8K/KLoQZu53NSo=;
        b=g9V79SYPiFgC2jKTQAVW1l5iGbJn+6Dh9NjzghW06+I8lRAKy7lo9BL26Ht3neusP/
         0me30L0TmS4H+qzVNtyItP9QIEDoBhwYUR5ceI8D0JEvtjE/a/cOrh3cObewZUtQK6no
         1oo4wXhx1Pc/U9QcgQ65dqXWQCxAxFTPHrL+R1JQxrKsXdq44XoDMzk3pk0mYPJsqCju
         yBiyHwRz+0YrU7MhrpEDPgSasT8XEc/VBErb8c2Kfd9W3YDRmLd8IgX0ci4Mz6xcuFx+
         Q8IQKPakmHOlekxFzZ0BkSL7qRm2ARF5XaL/gxMAhlkAkmrDlK1FGLifC7jWz8+6XNGr
         2PBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344089; x=1783948889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1W8mmlgvH3ozoq6WKj5bNebnoD5x8K/KLoQZu53NSo=;
        b=tNBuGuNoIEw15mdwcywQjRjWIybR9aRqrZjR2ngAhimar8nl8EEI2M5KuGrS+C7ocW
         hGtYEOqIZOohOGMp3yMrmNe9KxV5edIHq2nlU8Tu0axfLRFgvfgNqCPChZcCDC6puFI7
         0C0dq7K5hU5AZUvQyjl7L3z1AGJJ32W/rpDgGpl8KCBurp+5ZfYAYnxcUR7y33dJKtut
         w8BQ3eA2rGa+Pxxf4Sgi9+Qkb6xpB2hIBWzUggf6sgUk1/62KlEHl1t5oep7lzTX1Fke
         94BFKH8nhI2vrG+Qjkl1fDpwQhEcCLkkMdPtD6FwAMu2AfJVLwjbUG+QwdhBkc5gZQPW
         97hw==
X-Forwarded-Encrypted: i=1; AHgh+RrDjFRt6vuzIyVtmjJ/hY3Xqclv1FZqSpfsgVx2Y85rhI8WdVRL4Pl+YTpPACvs8QHkgQz3sC/zcCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjcYEwC3VO4hqWyN4YcFkQvHfMlYxTt5IwB9koYP4hQDO9ph2U
	T0vZC+u/eZ+DVkYx3erDjRaVdeiYLcYWTXNP6TgyU+prAa0RPxkWnrxB
X-Gm-Gg: AfdE7cnd1rZn4BS7CeNPxJZSy0DSP7jpbnDxih6wQJlRcKYUCJufQwmJHk0dCByJhca
	lML3y2Kmiw/BSvSL+7qb6LMahdLubb+0PCNwjqYluBN6shf6U3abtxZb/QET97jVQvCv1Ukeci9
	mpUywqOBqyU5CHw/KiU2+30R/l5v+1Bkqn2Nmm4SdnG4V6pLaumQLSk3Yz9JW2v+FxKVJhQLiJ/
	+6D0UbHr/ZziVd2Dj6vU4V0Bn3iiPxLcrxn8XdAz0tUgvoKau4MLP+UO5Vx9KIeW1fGfc62CN49
	ibCEg27Vo7f0vJh9COub9mO3+JnxJU8BFIybH7eQsbYk4MqEZUk4DtckSneFOlmwJ7HiLTuq5xY
	NKeEZFYD49G1JfVKp9XpJcYAmoSP00GF1cwYnpO2tXV85KbsJjtdMnUF7n2HUgIGRySsqD9lsRl
	doy1+BuU72OT9h4/Ppcoz6
X-Received: by 2002:a17:903:28c:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2ccbe607251mr5743165ad.3.1783344088779;
        Mon, 06 Jul 2026 06:21:28 -0700 (PDT)
Received: from localhost ([2409:8a4c:cc0:9ab1:cd4b:250d:9228:2c4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2caf06ca4f4sm43067555ad.4.2026.07.06.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:21:28 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:21:25 +0800
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alexs Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: update translations for
 process/changes.rst and sphinx.rst
Message-ID: <akuoP6z-GMfbKucI@archlinux>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <akn4oYmihmNHFOY7@wyuan.org>
 <akpxuLXKrbN7qB9o@archlinux>
 <akp9kzW3bG_pYLW8@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akp9kzW3bG_pYLW8@wyuan.org>

Hi Weijie,

I've been looking into the font rendering issue and have found
the root cause and a solution.

In the lore archive, the CSS defines `font-family: monospace`.
This instructs the browser to use the system's default monospace font.
On many Linux distributions, this default is Noto Sans Mono. The problem
is that Noto Sans Mono is a Latin-only font, so it lacks glyphs for Chinese
characters. When the browser encounters Chinese text, it falls back to
other fonts, causing inconsistent and often misaligned display.

The fix is to configure the system to prefer a monospace font that supports
both Latin and Chinese characters well, with a 2:1 width ratio for optimal
alignment. This can be done by adding a fontconfig rule to set the preferred
font for the monospace family.

Here's a commit that demonstrates exactly this configuration:

https://github.com/qiujiandong/dotfiles/commit/be193b3ec36a826b611d97920ff6afa76994aa7c

It creates an XML configuration file (e.g., ~/.config/fontconfig/fonts.conf)
with the following content:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Maple Mono NF CN</family>
    </prefer>
  </alias>
</fontconfig>
```

After adding this configuration, run `fc-cache -vf` to refresh the font cache.
Make sure the preferred font (in this example, Maple Mono NF CN) is installed.

After applying this change, the lore archive pages in the browser will use the
configured monospace font, displaying both English and Chinese text correctly.
This approach is generic and can be adapted to use any other suitable monospace
font that fits your preference.

Hope this helps!

Best regards,
Jiandong
