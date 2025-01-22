Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2894170A15;
	Wed, 22 Jan 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537968; cv=none; b=Hsi7CQTGwV7aJfv+KobSidliDLSDfJvvazvzpLwDrFiYaUJJ1JxGNmIDFdU8YnI079iyMl559OHhtJb4/1+7LLa56SvQeZcU0Yf66iNg8ntuupoDuYaRIQwz5MGfC73Z2TgBKm6VhkFXc3XoUhZRnmiAbeCI9txFMAF5y1FSuuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537968; c=relaxed/simple;
	bh=3r6zyT2kWjk7w8pZzhA/Iyk8RSgqRRMTiveA/X76AtQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=cAP1A61jua+BcbFRp/QGpke01H4FuCDuEmOfu4qFVP32ouRKQ/Lk1Qoy1+G5MolkY50jcroq1PjRvLz+3KR6fZ6uqBMAp0mWJY+teng16a6R9JSEYYR13ID6VGgTuLYcGoFdmQPpzEhRVfwlV8bg8idSTWuyQkLOC9mKi3UVYSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QE0HusKc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QE0HusKc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21661be2c2dso119618695ad.1;
        Wed, 22 Jan 2025 01:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737537966; x=1738142766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddqnn1vK4GrFw2WQST1oB5hPO1SJvMdj0x6qy/Nw39I=;
        b=QE0HusKcJHgNVEPztGG09kTa/OkRcDrFs6ijawJqEn11j5m1Zwx/U/Of0ctRGesIZe
         RPUk58rKAhELDFSFWvHv2oYNoia10fekLJt9D2n9yOv9YUREocSNVUalpX2cLYkTkfTZ
         7NAa3/DO719pAC5Gdd+EMgtKUDGN4CL7FzNIFRwWHjWwvtyTTpjMChcROjOFlm6/8wBD
         FseOHyjRL3kAzmpOpauCPPgttgMCQM+150seY8jQ+JmPHxX02GjaZ+/1IuinwgT3H3RH
         SWDSP3mxmjrlb6jvgi5B5VJVez/Mq4ES2fMZiQ6GwqzWjayF9L1CZj0V+2jNIKJQQkx6
         jV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537966; x=1738142766;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddqnn1vK4GrFw2WQST1oB5hPO1SJvMdj0x6qy/Nw39I=;
        b=ulxLGMPR0Y7+Q1/01d8A+87qkX3P3iFAgPxn5yferq9vHnXDGxOUYgmaF3fksUnh32
         w2OjWo6L2SE66rd67BQnaNKlfcCtJIvawvA0GaRivJgMXXJzh5Ci1Nlhiu62tVbG8H84
         ozKMfcu8kFX18U2xTX6ljZJu4ya/4wwWaP2u1cUk7AHmPTEU0cODcyW+5Z4yuP+0VFyU
         Nua9SS+cr7ZRRn7+7xL1j5gbMf1vqiFawEPFVi1Px6z7cP5cTuafwjDnBvU2oKGY1pvm
         92WjNexq0fHHtjeGXTxvcQsXalk0+SQtMzFlbJ8nQvyOJa7NoXkTaVekwXZmtCwI5zz3
         SYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3yUzs9gAIVKEgAJc/YDk/zIU/Eyjf/DUqGs5QOTmgiMDi5aVjqml0hRowfOrkXdLSM8qgzR22h+ALVqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YymG2XGni0MULmH+WNH8LYYjNvBxL0GWc4HX+obCn1otCGbDjbk
	/8ZV79VRhrQ+cJ3LW8Jlb1T4sw2lVK5xe0Cua0abtIqfRe2FQQek
X-Gm-Gg: ASbGnctPROhfAn/3Q9yNpYKVNsuEz7Gk3v+C50UFo3Ce9QeCONpzdgtfzWI+//tR7mm
	jDXOLAfakPtXWuZcuezcHXWPR7B5dNmL/Z2+/P60qMMKhvEqjy5Z+soOon6ZvPnjzPSsNDCJR8x
	WtZsPdW0XEMgMmBllW6AKd1vC2+FmS29QmSI4cQfV67LqIx7R/4oZBuEks9w/A/QFin/1FuMNIi
	d5/P36lBWQXvCQGTFMzHk0rPCBNEhiJnHjVIWWxlE6xAyjQUmSziToxv5qd4euRPgy64rNX6AZK
	SEcwFcJZW8qsXzxUiFxzHiIh+kNm92sykaQF7G71
X-Google-Smtp-Source: AGHT+IGIYu61cE0+6W7dAojzMO0sNJSmiv/uCuL1u2R4YWWqJuYDQzsBr1TWTgvvAdQaIlGeU54CtA==
X-Received: by 2002:a17:903:1ca:b0:216:282d:c692 with SMTP id d9443c01a7336-21c355a4923mr332184255ad.34.1737537965713;
        Wed, 22 Jan 2025 01:26:05 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9eb66sm91634915ad.40.2025.01.22.01.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 01:26:05 -0800 (PST)
Message-ID: <e7acb5c7-58f6-4b06-a339-83825780b71f@gmail.com>
Date: Wed, 22 Jan 2025 18:26:02 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: carlodelos90@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
References: <20250121230213.10701-1-carlodelos90@gmail.com>
Subject: Re: [PATCH] docs: Fix backticks in README instructions
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250121230213.10701-1-carlodelos90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+CC: Jon]
Hi,

Not a comment on the patch contents, just nitpicking.

carlodelos90 wrote:
> The commands 'make pdfdocs' and make 'htmldocs' were formatted with backticks. which caused confusion in some contexts, like GitHub. However, using tripple backticks is not universally compatible.
> 
> This patch replaces backticks with normal quotes to ensure clarity and compatibility across all rendering contexts.
> 
> Signed-off-by: Carlo K <carlodelos90@gmail.com>

I'd suggest you to run scripts/checkpatch.pl on your patch.
It is good in catching issues in patches especially from new contributors.

Besides that, you have failed to denote a patch version.

I'd say [PATCH v2] in the subject of this patch.  Next one will be v3.

As we are in the middle of the merge window, I'd suggest you to take
some time and skim through documents under Documentation/process/,
especially submitting-patches.rst and submit-checklist.rst among others,
before submitting a v3.

Questions are always welcome!

Thanks, Akira

