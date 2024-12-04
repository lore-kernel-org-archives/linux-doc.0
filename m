Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5012500BA
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733274421; cv=none; b=OQe+rgCwj74mVI9wFeOMkNvH/qJKia14H8koIVfSzuX5n5X/TeTBtX41kjNiyfNxUMINunsvX6/wFUTGbtoSgB27n2NCDdKpqjH3MHgHMuyCR1jJPHC8hkzZ6CBX/Z4FUX86km7cKllBRjQjNIAfItfoaAYAp5Ul/oYOIM8Ja3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733274421; c=relaxed/simple;
	bh=MC7AljCRogbPP7nv98cOsHc26oZBN/K1ecZLTmoeVsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FD5ib51gM87H9B2qCUyoQeFXpTH97bTKy/X4ywhhAKUBeJM8g4xhDkUaPVLvQEyYNei3BOlpdpz+GYbt4nSbp0/dL+owfM3zHNPAsgA2ylt+ri8C/O4o3MLQ5GA2ncN23X8Y/kmbfIkshDbuckL8EIm1JgreevhlTQb4H3vTyv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B05DU6Hq; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B05DU6Hq"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a75eaaab59so1622445ab.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2024 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733274418; x=1733879218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+Jz/Q6nlrwZViX03mS36dj9lZ7L1D6LvW4jUlY+Okc=;
        b=B05DU6HqnqBBJLf6glsXGpUEC92uhrH7rTNlFwJfRapv3NrWeod43g/BUjrNg84P8a
         UwKM2humEP6TCRRRxAvyhDzeVMAApYgs4PWYps3vEjcATqARIqJEZgKYMw40wMz9IRqC
         0NX4n20/MnnErBNMyKCu01gLZag2vVDpdF/xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733274418; x=1733879218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+Jz/Q6nlrwZViX03mS36dj9lZ7L1D6LvW4jUlY+Okc=;
        b=iaDeZSwqZcaC+iRU+1hXI+HoI3nHAM/48L8RVj843iuqHpdjqHGbBG7tMuB16BP9gT
         rqnu3G/4UinBuCp4b4UzHAIRDhdosOvIX2Wdh8itBnNNlrKst61odpFqUvzPrBcy3mC6
         a2AzHZ6JgLu8DKvAvuY6Bqt9tKbmZJvbeTHUBVYI7jpiyAktste5lfWpiSror8033ocq
         H1rpqJ9BPwrYfId3qbNWEybrY3/JrRen+cW4HzPucW8hBsZUzQeDcwoFanEIKg8uJBF+
         lwFrdnNEWIDqVb5G0hQWRYjRXZC9KdpYcgjLIjQ7QMTqNMyUROooq0J4r+WNRS6ZVEmB
         IzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaO8IxKfIjoDiN4Y+tpgq083gEiBaXq/vyzr21fUL/ZjkqI2Ygd1lk16xtbJFRi+d9utUSo9hOv7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFd+/0bZin7zvITky6JyU7lxo+h9IyZqzxG17o52eI98qDDi2q
	qO9NgrLw/tD8jtKSDhE+C/zmK+d2rbC9fid6/WJYAS/qEzKHr40lKQAIp8GvRWU=
X-Gm-Gg: ASbGncsPYH3jeWOwqANkeVhFvC1Ghe82iNAbqIW4HDkFnlKzdC1ODhqOthhjmuahaiZ
	Bqjxn6d/vWJMpGKDvD5uaDi7e9URZekgH4VBDZAgXI05k6SG7HNbqaCamMWSZt4DrszWJcETHL9
	UynR6CzJA5nEYB6ISrfSm86fs+xA9hKiYMhXP8WKCxOa4FaThcOU66Vtf8Q3JRkHhSrlejkTXJs
	EFFN1T4WU2qsh6Y4p5LpyLqApxHBBsR3IDl+Rucsus+0oidEY2NskQLy3GvzA==
X-Google-Smtp-Source: AGHT+IFF+W8l62dy02x+rstW26StonwY7Oe2+iYejLd+cAhPUZAboveR614K5+yughF75bXFV6i5tQ==
X-Received: by 2002:a05:6e02:1c2a:b0:3a7:ea2e:3992 with SMTP id e9e14a558f8ab-3a7ea2e3b09mr117670445ab.3.1733274417755;
        Tue, 03 Dec 2024 17:06:57 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230da8ea7sm2809030173.32.2024.12.03.17.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 17:06:56 -0800 (PST)
Message-ID: <e6b160f0-88f8-415a-9734-2ba659619688@linuxfoundation.org>
Date: Tue, 3 Dec 2024 18:06:55 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 DONOTMERGE] docs: clarify rules wrt tagging other
 people
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <c29ef5fa12e37c3a289e46d4442b069af94e5b05.1733127212.git.linux@leemhuis.info>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c29ef5fa12e37c3a289e46d4442b069af94e5b05.1733127212.git.linux@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/24 01:14, Thorsten Leemhuis wrote:
> Point out that explicit permission is usually needed to tag other people
> in changes, but mention that implicit permission can be sufficient in
> certain cases. This fixes slight inconsistencies between Reported-by:
> and Suggested-by: and makes the usage more intuitive.
> 
> While at it, explicitly mention the dangers of our bugzilla instance, as
> it makes it easy to forget that email addresses visible there are only
> shown to logged-in users.
> 
> The latter is not a theoretical issue, as one maintainer mentioned that
> his employer received a EU GDPR (general data protection regulation)

Thank you for taking care of this.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah



