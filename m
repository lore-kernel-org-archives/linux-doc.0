Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677041;
	b=xs3UEJ4THcYOzjiQmdayc8bhPK8IbhFf7rPQ5yLWPScTKVamZ53oEGMysa3pj6ziDJIV
	 Z5lXBCaoqZ7s62+voRRZA5Eg8rbx1LKleg3ct2kzHZr+mA2upeL1c5LKOL5huPrknQgtX
	 dxcEDJAVEjPWgmnPmQYmUsUjjGIbvPgrgnbQlqzLbCsZMtq4juyJAWrfsbbEhixWP4JZi
	 OS/VO6BhhjVr3b1iEcfTmbcOBB0QL4yqxemaEX/mg47HXUkKBvd4W5Xo+VMmjzQ+0fnS8
	 OSBghFl4TbzQZ07nUL1zWX2jYtvPDH6XcMLMvFSJ9T6DjtOf8N4IMV4eekf+2h0Znpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
	b=PFof1ZPLH9Mt06rxoFmXkff7wh8tz5OvTsiXZuLWo2Yli1D0mrg8nZXMs8+wwf/jxBgl
	 LqHDer+q5IT8S4EXI8Aci5GpF/vrbjLM53QX945L0lmJ03eeJAGYuyU+ksF/E4mJOtEJ7
	 iaJNIsC6eVCS0EmdE8d+/tAqQNz2eOecV5sLvQ1jTN+48qeuhHUsaXvPci2/uNIdKV07F
	 AicHA0xofw1QrP6n+IkR+maMGcOs4Fnk6s4Gs7LdiWHNiRKiY61Hil5yeokRcsmIvxWGT
	 lDxdNYTbOISRi/uNRH7AuTsA4crnn0FrsvYc2wQk1GKoF8Oy3BL2llvoJnR7/4oT4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHftsPkn;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326A606A880
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7326A606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AHftsPkn
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso11691105ad.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677041; x=1795281841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
        b=AHftsPkncyeNzCw35cYmUb5uWh3idT8JrBvFxVGL/wN3/L35yj5itI78iLapXYJP08
         o29VMAhIEUoqPQkvbH0XIBQdXuM+Nl3LfgznI0+abVovu+waFjrr4gu0uahphbErnYjR
         MXJPLp4GTEzS/paquWKnCiSuP3EzpoerW3qyOZrejRL/wtV/vDak0btq6yY4m3cxXcUz
         oeUN9ZRW3g7Z6ZOmPZK8Jpo4+Wm0EfpFTB+VQ14W7IFL5/2XHuScyhlmd40j7bE+6MC0
         KVeTfHbO7CYLuEofYvoY7FfPzue4v/86hhWVBqKfzwlhdo1enxcPVukGiyJBC8waq9LA
         fMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677041; x=1795281841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqQSndqpZPRSMRb9R3b1Tnrq4ikt3n8lwLKgdp6GvN0=;
        b=QwexXwQyu6vfbpt9QrYHxZNWCDVKOPAx7GFPw1VM3EU58FsH477iehfIKBSB4d3zkb
         cd+SK3hl/+wLe7eKV3UcbFkWbtWDX/N2/OeYhOxvo8yexCaf+ScxWYpiqrOTVoR9Lkj7
         4x8/kO6hYtM8rYul9cAyx7LiYbRrwWBJdcpBSQJ+a80jJGfqLgk0g2E2tWnC78Cv+uGV
         L+TzpN8Y3FBsHD72Pry+X5ItNn2EVt3lcduBlUROv0A/Su72IjOSpIj0m707XAxvQlEJ
         YknZcpFEDjukd0YNjNNXtKv4PwhFxvYAamvNff0BZRmTTjglqnZJrb+o1SRKOfy1pxnv
         8iFw==
X-Forwarded-Encrypted: i=1; AL+hErHIy14KrayYyRAjck710q5Zjc/p9vKK3iEkviSlg9zxJBb549vVVOZhAAMlzY6btmJ+7BJAAluVmpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wvF18So25UfkYDvYSYy97l0tjJoyEu2FrYNK5zvRx7hzgDJhE
	m2JIx+fqSbhgfWkFb2eIjQ0UIDcpO/FSIoWrSIUgqi74cQEX4Qvh1Yct
X-Gm-Gg: AYBFou0rbKwOr3b+MfYAo7vi/EXEgaC6TKyv/amY4m/8aeWbrDbNgn8MU/Sfy1kyc6Y
	QL/ywrR5XY4pH/if4PjRMcOxG2r1FeXjL7rLh4V/nZtCdsaTgN0AxsrK7UYRybWmfvAl8wQ34A2
	0nWs4XKaHEJkqSQRiumdtvbqkeyYmnejnpYDJ7AIvMNzWPyl6SDUXlnfZRXe+Q+iPch6N5dN28/
	WtIISOvvgGkr3y+NpKn4M/MwhbHnVWkAp3HPdsTNxYnqv2hM6nZkUD5HVx7kN9uITeh7GhiHln/
	/o/OihEPNriv/qcO61FPX1bNt+fw9j7zzP8QffkoFJf23yFGetZaV/EmXCvFAH35g8xib5rqLE7
	3cZtqK0rnrH66YXcng5TTgQtx1N2m/RX5nCyas18ooo3gADfMeFGmDWD6F2RKQlkWQSZV5/cgDC
	HlV3vYPLApkL83FdArUVlLYJt4EwFWXqe7DmyUr8ptKdfBtWUV39YLIupPkGNljcodFLGhPuyzF
	kztnFrsVjDjNDlT0IlKZcVJv0c3feJIy37cGCpf6ffEvXTMpLGKbUZrrEGzcIiUHjK1Rzp96FD3
	ieyh/rW9P25srhPi201qzLKeXMFKVIm1E6ZuGU+RdQ78XVuYa1lUE6uzLRCqC36M5mg=
X-Received: by 2002:a17:902:d4c9:b0:2e5:4604:c375 with SMTP id d9443c01a7336-2ee0dc91820mr60268405ad.48.1794677040704;
        Sat, 14 Nov 2026 09:24:00 -0800 (PST)
Received: from [172.20.11.208] ([64.141.80.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad534sm22503985ad.9.2026.11.14.09.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 09:23:59 -0800 (PST)
Message-ID: <2d7db808-607b-4004-b9fe-8386ad4723d1@gmail.com>
Date: Sat, 14 Nov 2026 09:23:58 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/sp_SP: Add translation of process/4.Coding.rst
To: Antonia Ruiz <antonia86.ruiz@gmail.com>
Cc: avadhut.naik@amd.com, bilbao@vt.edu, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CALv9EdcctPgU2i2MJiQWwMCy=sDN2ridqbeWodz5VcaBhvj+Fw@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CALv9EdcctPgU2i2MJiQWwMCy=sDN2ridqbeWodz5VcaBhvj+Fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Body is empty, Antonia. Thanks!

On 11/13/26 22:41, Antonia Ruiz wrote:
