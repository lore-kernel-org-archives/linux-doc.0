Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240C38655E
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128384; cv=none; b=hGPBDddDCKsB0yKzeC4IFDj4rNzjvuLUhg3/76Ajpnb0QH3DZTrp0ACh9QpElhs2ICkPjw4QPclbtWMa9dgJZn35thETnFSrzm8iKUhts72ObyS68bWkos5hMK/mf19ui1LhQdXCb/q6GdAnlMQwMTAXtoiZTboXvO8CuPQokyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128384; c=relaxed/simple;
	bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCOZnBp91eUok73IIZvdMPQh7rdJFvHDFr8YzjtytTMuTxxbVP8ulLML05nLIzr9q+laHmJMXmuj9w5PnGTSvEVxH6ULRmMCzpco1ZBOjJmjpsobOuMsnFxtfs2RlKyfK6slLt7A/8crBAK7PVKaKHxGZhOBK0PXgrT3nd4xOwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nL+HNbQT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nL+HNbQT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e5624c053so1562198f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128381; x=1779733181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=nL+HNbQTZ5Yn0Xoa60Gk2Cgr9XqqZwlFFkJM+ShxdK11YEOMUNL0vcd9tzFug5sWKz
         2cbOBz/prx6kJcgFYNBM1FLljWds9tb4vqxxFQMTYB7MD75k+H4JbVE0unI9JYs17B8I
         EiSZrfi1IGvRX+Up7LSwDpfC31FpyEecWBmPHViLUB/QB8EeyVzI1iRlxu0TKWHXMAvf
         MTfMOXVygd8oyFybXQGKl+J9N7Ey7+3UM3SCoI1Ff8MeePJPZp8urv5Lz4hTIkj7Z2wB
         WfIjcPTevk8T3N+DhUH1nZzMGPQdBRHwRhoQJZh0Bt6czDbd/hwd8E8bRRncfQBgKJDK
         p83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128381; x=1779733181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8xFS+reyo4EkCXhRcUbUpO8uVADqC7MT0R0uL+qQus=;
        b=XNiouNJxP9aDkkKyAyjiPMc7O+DmrIBy/nU9R6tbi7NzcPc438Z1/FxvveR2XEl47q
         xt8CAwn+2KjRD/CajSdh032p7M90bS+IdL9Uy/OQJAO7I7ueg+NHMEbph95HfCcjlgTZ
         1ruGVhElQ3PzwN8jqkE86IKBsrHcJ+Z1uCQtZoitw8gYA2dx+p6/7iLErdA/dnzgQ/BC
         CdVCXEzvKa3ko1rxuBxvtpprsCBDE8lVY1XwlthpvL/9y6XTDO6cfyxRZs58ZRCHmbGS
         zirsXK6l6vxnkIWwrXT8dtdFmKemIPED9shJykcZ+72Sgo5eAiuxchVoux52YYMHmupG
         6UNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T2BiiXdlGEiSvau5rkQ+G6YoaEcn3VeE9K3TEbHDd2ixkwyA0wRpeB3R/4N4eHFlRsgd9w68S6X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCkL4Nmkfrq4v3i88/QE5i1+5SOA5lh1DoePc5sX1yWmDNgIDf
	YBKtyCTAuyoEvzPDsy7fLTr5Gw9W5vI1/POB1mia4X1UnqcMw2G4CR2h
X-Gm-Gg: Acq92OFkvoVzr2wMJmNSB38vnbABHEe6Y/OXYZsafGSU/lV8giQsM6xZ/vOypPLr224
	BodByVWYSTQU1OrxB3ayKzTL7IyuRq7Kbjht2HRby1OT963xfdlh1cRIhiIJ//UfMBHa/8BCDd4
	2IJXCP6WEiMCNu8k/6XmWdY71YJbjdVTSXyxO+hV7uw0T0Cor+Pfvyv8FU9k+Z+WH5otQZeeilg
	mR1iJrfCfgKNU3eDRZ5w0fAkWFPLoMSPpIErc7lBUnjf/0U7nYBoZrynqx1l4ehqFeootprN1PL
	gNJsXtDPy1ePOXUTerHjLCrYv2xJZnI+p+6X8OE2R4nr2sNC6Su6EeDZzDyKu0yiQwhOPpsZmNJ
	AfLuXZxp6RrI5cV/QY9bnol9n9zeJ0Bog77ursCCiSb6Zm9E5weu3rpPDEmTIvsEKl6uRvgNMjY
	Nu/4U/6uQfSN9zdYkYvPXhcE2lIDGCODsKtAu4M/ugjm0J9LpxHQpinxgfKVk=
X-Received: by 2002:a05:6000:2489:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45e5c58fe72mr24859160f8f.4.1779128381341;
        Mon, 18 May 2026 11:19:41 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm38425105f8f.30.2026.05.18.11.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:19:40 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8294a089-4350-4013-a644-b7cb4ffa5130@gmail.com>
Date: Mon, 18 May 2026 19:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Arnd Bergmann <arnd@arndb.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 ljs@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, qingfang.deng@linux.dev,
 yann.prono@telecomnancy.net, ej@inai.de, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com>
 <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
 <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
 <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
 <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ef59ee46-87e2-4f99-babf-4dc8ee3cbec5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 09:08, Arnd Bergmann wrote:
> What about dependencies that are normally shipped by the distros
> along with the rust compiler? Would it be possible to allow a
> range of version that matches the ones that are present on
> common distros like we do with C libraries, or would that cause
> more problems than it solves?

Hi Arnd,

Yes it's something that I would like to enable, though we first need
to wait for all of kconfirm's dependencies to be available for these
distributions.

I've filed a GitHub issue for this in the repo of 'nom-kconfig':
https://github.com/Mcdostone/nom-kconfig/issues/149#issuecomment-4480419622

Also note that the author of that library is CC'd on these emails:
Yann Prono <yann.prono@telecomnancy.net>

I will need to do some testing once all is available, but as far as I
can tell, this would not create many additional problems, though we
would still need to provide crates.io as a source for distributions that
do not package Rust libraries.

- Julian Braha
