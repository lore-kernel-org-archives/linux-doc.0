Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1A53E00
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709017022; cv=none; b=pTbNXtyey5jAoqJRjKX46Fash8gbwiI7fl/HAjZ9REcLhbs2P3wjq+O8b+IjgD4rJm16PfkCvZIwX3BhXnR8IAPMCpCiucBdOrdjwRZ484+eYZj9ikdWL7Cz2/Pk+1TqjphQhfTJknHSW0jzrkPz3TL41QovAoOOpnVeY3bhyrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709017022; c=relaxed/simple;
	bh=McV76geOqE+jju56IxcCj7rVhef+PO2rVf8/tj/Bppo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=i6uB/fs9UGUXaAsGiDUNYrWgCqEMMJYHnPasP8m/qd6cEu1aLas8CgH5sEzA/yJwSQt4AVQQtmvg6RKfnbuKaAIqV2wXQMPPu39Xo2jB4UVrHUDXi4loRzkJv346zoUCy6zF1Q9ZuEjru72SypdXc6WX7sd9FTEfBsEw+fVQ0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZRUkgE9; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZRUkgE9"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso3746185a12.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 22:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709017020; x=1709621820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrwGVxIi25eXkdUxOcYJjEj3FWlfKeiG8ySaw7lr8Zs=;
        b=YZRUkgE9BK6jIBPoHGhqAA2yW39iwHEXqz6hczwQeuvbLebaKYX0+GSjj4S8IX73UE
         qMbpoDi85PKHlcPDgePNl862bL3IHeUuhYfZA5rfm2lWCbJb4O14Lpreayiu4ceU7sRB
         DrAG88JiclrCidcChA2x3Hx7pKfLXeiSImPeFHVzAMhzwYNjkL2uz8r16lHKKLmob83W
         AOqbx4NaTT4kKbWyT8LsWLOKV0oeahqL3Yq3LnfCdM4MY+6QwnjQ5/m+HNc1RNfAOsG1
         bdZc3y1JEvxWwwtoznNWTaKVu2wFlaVnwaceh+iO3X8hJjcgPKalhDhr2bHvXNGVgx90
         ++6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709017020; x=1709621820;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrwGVxIi25eXkdUxOcYJjEj3FWlfKeiG8ySaw7lr8Zs=;
        b=UbOO4Yl8rDkdLF7/qRkLl5yKPn3jow005sk+0Sf0Np5X/3GWfJoe+msBu2ejZFf+HF
         bioAZhV7xwUWy4d2Fras6y6MP50PIp5HAeRyTgU8qA2m1i9VZR6ZBAceto3zTiFwLtfM
         xhXVb3US8zMDzp/pUFiFmqCEGnZ6N66KXr9wkHqGkApUd4S48zx1XSK/uDRIf4XE5aqY
         VvNYPu3jtY7c/YKMOlzJkZGdNBGVD1XDW+sSJ0DNPgxEF953cJzm9o0PxiSxlF2LDPlF
         oGVzdJ5xAfXaaf6RCAnO8ptcPzVSAwMBGiCWX1sWGet/yaVVCQJxkmFTlvBmUQ3SDkzn
         J97Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwe/KAzi4QSDeyhP1nBXVoJBUhXaf7xwmAbZ4HNSUixXM6v05SlvniG4zVySXYj+c+2IXir2Q9osHss0l77wz1ePGQ6eRLtafh
X-Gm-Message-State: AOJu0YxgezX7qysj9UbhGn2NkzqVTih0t9KrhXy35xKc3BhI+skImimQ
	1GRE+WiFAeGjzmPAXCH8CulOkvmre5rMVWVbpIG58yLQ3PqyROTe
X-Google-Smtp-Source: AGHT+IEK9Q+mwx+91U/jZD9Ps5EfzVIop1f4LqfuvfcwgPpCEvPVgF9b/rMfxYl/qQtiW3rqxw/4sw==
X-Received: by 2002:a05:6a20:9d90:b0:1a0:566a:5974 with SMTP id mu16-20020a056a209d9000b001a0566a5974mr1304652pzb.61.1709017020443;
        Mon, 26 Feb 2024 22:57:00 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id kk4-20020a170903070400b001d8f6ae51aasm781860plb.64.2024.02.26.22.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 22:56:59 -0800 (PST)
Message-ID: <a6e683f5-3088-48ef-9930-93c95e85c5ce@gmail.com>
Date: Tue, 27 Feb 2024 15:56:59 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: lukas.bulwahn@gmail.com
Cc: akiyks@gmail.com, corbet@lwn.net, vegard.nossum@oracle.com,
 linux-doc@vger.kernel.org
References: <20240226093854.47830-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] docs: freeze some package versions for sphinx virtualenv
 setup
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20240226093854.47830-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[dropping most CCs]

Hello Lukas,

This is a friendly notice for filling in some contexts.

On Mon, 26 Feb 2024 10:38:54 +0100, Lukas Bulwahn wrote:
[...]
> Akira-san Yokosawa reported this already in January 2023 and Jani Nikula
> was fast in providing a fix (see Link). This however remained as a thread
> on the linux-doc mailing and was never turned into a patch for Jonathan to
> pick up.

Have you read Jon's message in the thread archived at:

    https://lore.kernel.org/linux-doc/874jf4m384.fsf@meer.lwn.net/

I think you can see why there had been no submission of a proper patch
in your patch's direction nor others.

If you still want your patch applied soon, you need to convince Jon.

A patch that helps us to go in the direction of 1) in Jon's message is
most welcome!

Be aware that if you simply remove ==2.4.4 from requirements.txt,
sphinx-pre-install will prevent you from running "make htmldocs".

You'll see this error:

    Can't get default sphinx version from ./Documentation/sphinx/requirements.txt at ./scripts/sphinx-pre-install line 305.

Happy hacking!

        Thanks, Akira

