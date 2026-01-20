Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED343A4AD4
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911522; cv=none; b=c6gRSmL8HNbTK48SFQFFiKAYeR2NvS8mo9XSV6OqkZOLnZdnxccOILPmxSDYfUHJ/HrSk3CWmx3kdbg1QFj2WpXaM0jIFrg1pHRbtW9UfGXmJ2rnE5eeefyTiqajl8XdMjh6fl51ftR2yoBZBQ6nnAMr2lY/qyY1RC0oC1H+/N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911522; c=relaxed/simple;
	bh=yGS0ZhV/HmECUguQyiOv2PcpOrExvW9AuC6J9fOS0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nncbfw+IKMQSCh8Woy4Z5bkzeh9QUjd1NDdMRZbd6t6itI3Lj5mIL/CShUfx2K+b4/dDPz/0972Y3X8PgoLHID6vIVUCVtTo0/jnUF6nMYDFE3pzvRNdYi5S1ePtwX1aVoe9BX7N125ReFgmvlV/GPYGnFi6afRbLWWZiKxld3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TxXPm3SX; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TxXPm3SX"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so27578045e9.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 04:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768911519; x=1769516319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1QLxkpeIxpFrMstTs2QBaunDmwUVDSpnYCC8/tZjnk=;
        b=TxXPm3SXzYXEWMyPWwXJiE31IPvj/QAgzjMskSNjekWpIy8sah4x6dvWZzlGpMvHsV
         Pox7nQBpHWJuXZuF11o4Ox9fIXdsJNPC9rZI5yD1kdfwdLgwWw8bMHFs5OYVhbuvxm4H
         rCGYf9nNMyNXX+C/pgJxPTbVwsjf873WS0HiF1eiDfJWhfWyZIDbRsQN+YQWTvg9epgM
         UHucV0hmPFBL40hItqhVW8m9sXCFsV4LGTudxesOaYwQ/jNAVRCrBF8L40es0f+mF46q
         dfeWBae3RNbHrcqFTrw+kcgdspJ3c284/J72VorVubEnC5EVQD9qm1YzI63FuQrrdKsP
         Ubzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911519; x=1769516319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1QLxkpeIxpFrMstTs2QBaunDmwUVDSpnYCC8/tZjnk=;
        b=uinATuY9NuFY+PzcDF98+AO26SfpYMp7a1E7EyR52VgKZDqx28DXPo3RTkdNFV7EN+
         bSG2A6kWqquG75z3vZs03iKfQYeQ59on3deLXc8Qt9zv94QT/frQ4O17qhFXZqEVq4I1
         O86+kboliUklDvG5ArPqJa2qP6chzgSy1ny9h5Jnz9Tl3laOL+c2p+dH6vVO7tJ5ta35
         5mB2NKg6+P3cgr0/HHW7bT5MeJ+fibhjp0qMeNvPhFeG8b0FUkSltvyQHUiLTTxSK1jk
         YXrBItzARmT1XRZalR2fwc9QitzY765ekLxy/KP42+1ec3IdKdQyrHwj49O39IFmwLiv
         E4tA==
X-Forwarded-Encrypted: i=1; AJvYcCXqUzTaPmd6vYjDf0HZmTqpBNpyItOOqnfa8micR1j9HbnMpnckao4GFStHrhgDRBRyqK79okPQhgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7mTPVkP5BoSJzMhzX+5s5roYr5g0fEWXG1wovJNvSlHXwjn/
	1LZs5RN/oBAorIHG154SKkAP6LGQhbdXF3ecnOKG6YA7VNvgSbqTI737dxdlw6Wa8Yk=
X-Gm-Gg: AY/fxX513Y1Vsda8V++9XTQlZMsC3D19FQkPSNtM7fmHjPlr3EQa0NHiU+qiFzyG8GG
	qc66/zwpnX+rwFzp8Gwtr2XoAHWJTUBtAlOD7wi2NaA0ZcnJ00f/EQ3fDBu4o4FpG0Sd1RDlKgm
	ln5PIWf7EOA8r0SP7BEuuvWJ/I9kEZyKIyVY7oGe4+GRq11ViaRm3VtKceGo9zK04hEvOqSmYQu
	sZrzkubsw8W9ouLNrrHAbJwlIb+XKgny5tO73+d9v5dGTaiG7Dvdu7bNmw11zWEwOn2qK+g89Iq
	fi6owNQsjVVx4o6QpW90N6P0Z79d2NKx8C9WH86K/91rj9m2pYLwzF+O4mzURSk4hKDylGZ04Tf
	JfFjIW+niuM/VBBjHw34aZjc45yKcS+eT0fjKGoJrhSHN24ebQr9W9sl33Q0JLyt5V2cHGGhi05
	yUn3gJZxyQvEPtelDAXNW2sq3yYKTvww==
X-Received: by 2002:a05:600d:6413:10b0:480:3a72:5c10 with SMTP id 5b1f17b1804b1-4803a725caemr54816275e9.16.1768911519124;
        Tue, 20 Jan 2026 04:18:39 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm306330525e9.2.2026.01.20.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:18:38 -0800 (PST)
Message-ID: <f1128fe0-96bf-4819-9315-dcd4a7dda2c6@suse.com>
Date: Tue, 20 Jan 2026 13:18:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Documentation/kbuild: gendwarfksyms: Style cleanup
To: linjh22s@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
 <20260114-documents_gendwarfksyms-v2-2-297c98bd62c6@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260114-documents_gendwarfksyms-v2-2-297c98bd62c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/14/26 12:47 PM, Jihan LIN via B4 Relay wrote:
> From: Jihan LIN <linjh22s@gmail.com>
> 
> The indentation in gendwarfksyms.rst currently uses a mix of tabs and
> spaces.
> Convert all indentation to tabs, and match the usage output and code
> examples with theirs references.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Jihan LIN <linjh22s@gmail.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
