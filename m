Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D4A802
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 13:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402522; cv=none; b=TP3Qp0A0YMNFqwX35JzdtOAp6vXZW7060GPzmwTTfy30x6uLQO2xpGWHQQ1NYHU9G3L6HwuS1gg5qycT48l41Q7AB3Ycik9Q8P2q4xed64FgcEgTyX3JuUOWj3jhLIIX2SnHbVKF3+Z0VlZ0uo+boixr3kl3z8RTSQObFOdK1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402522; c=relaxed/simple;
	bh=vFkgNlL2GRBYdnYTlALNbz0T+xDskFNaLNfE7IOTpyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=snQ8JX26RhhPLIlISuq3wQgk89r3E3NvvOOurvAYPZ8wdOyFHIeSXhSU9ii/xgynBUgLIthZXQabdZcTY8fUeY6g3HO/YTXT4nIUI+tl7Jbe7WYOVvZAC0h3S8K7b4NF4+sRmb1lDyo/PiZrd0PW46bb/0biDM9FkK4vZLxddys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jomUHJSj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jomUHJSj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e6028214so92308495ad.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 05:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740402520; x=1741007320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2lSJcTp72gnLdpPPLaeDu8bB/b/7dW2hbSTJFsMqt4=;
        b=jomUHJSj7VnyR8Z4vYc9WbxWVFVrbL3O+YRXRmAvDpw0D5AZpHWzg28jZxteFwajdI
         QuSUPy5fuCr40QHuyYOTws3mreAtKgoMz77PyDDN6mdl5mtruTfEkz9vQPpyJKL51Jja
         wc+/FY65QCnqugk3ALsBadTS0yHTvvW2gFuNM7ss54LJA2RGvnab1PviKGABLtnUmAGP
         5C3V6rL97ocSRiuoqDpr0Xgft8whEnahEXkbe9p2ss0GQngz4KNV/atfekbpZdFT2l88
         5UcA3OhjN159C/luBMaAzfYPYTYL/nnHtGnSBtOPp5/5hwYewxDvZZ5iHPRxYXkdWTrF
         XwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740402520; x=1741007320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2lSJcTp72gnLdpPPLaeDu8bB/b/7dW2hbSTJFsMqt4=;
        b=P95H35HSrF2eRH2YLLRSglxZhAWoilc+xeHTMP/+vkTjllkvPBjVa9epYSiup2IIVC
         i8dCkblbsnxty6r9kkEpJJvVnRFVHXAH7Lhp/r2KXPxTicdQB43uOG2MhW4PZc5PApeJ
         5xlKdnlIAM/CXjf7XLB1OuWaMe3l9c2ZCjS5GmKnf1xPbk6RgRKkxnPJ5Y2bIe6NaFQT
         FLknhWfHOPgqs2Hbba4VwUeBaKMd9oOpU5MYpRoItZbIFADTGC6bXsDvJl+5mxiGbX83
         yg/3j7CCOYJRn4A/lxJfXtnVjkumUeVVHcgTULITyX8iYXbIljOVq7KDp7v9htSsci+B
         X3pg==
X-Forwarded-Encrypted: i=1; AJvYcCXlgXf3a6HdO5s0a9qXetOmoGsmzGI5E/FzLsbrVlVVsT8fDdNmTHCEG301vlRyWpZZFahKnztelEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4m+BZVi7dEOdWCTMyUXHSnuN+RnlS4QJRvskIZFbdLJwgVRO
	1l3HlLtQcLxYjA/2PXMZVU4HgfUmh0vTx+4M3ljk5awk/ehAtXQsVdH7mA==
X-Gm-Gg: ASbGncsOJ5XA3B1laHiMYSJ74w++HRpybV9GqFaW8xbnT236qu9NDCzxgOv1sRg4tRF
	heh3cEIe9SsahleQfKZI4uk3tQtHmtxds0awbCSKUkeB505GQsRneD/ab1HnIn/plAjI+Yzd/bx
	8C+B1LeONgMTH98Jsd6XbCrEtyoo3yieVVMCkVBqvIcWedH031WVn0XTHrd/Ed9FWF3fsDh8vg5
	R6CZLx4p4J66ZiluVbs70YePUu9s7pnP6d8WX2LH5oX+rZo4FyvxUAhNS/JKlJaalLQEP/baTN5
	6Oz8PmsXYSMh6vPQB9A2F/YKhYQ5BsQn5Q==
X-Google-Smtp-Source: AGHT+IF/DOeCCNghlFS1MFPQzcFBIxVcZ05fkRyF/HZ0gEeGfFNK9v+cWyriDW13OthC0lhXd6206Q==
X-Received: by 2002:a17:903:32c2:b0:220:d1c3:2511 with SMTP id d9443c01a7336-2219ffb8514mr180904305ad.26.1740402519887;
        Mon, 24 Feb 2025 05:08:39 -0800 (PST)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366729sm180140585ad.79.2025.02.24.05.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 05:08:39 -0800 (PST)
Message-ID: <905e5a4a-7e67-43fb-849b-d85dbafd7f56@gmail.com>
Date: Mon, 24 Feb 2025 20:08:34 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Disambiguate a pair of rST labels
To: James Addison <jay@jp-hosting.net>, linux-doc@vger.kernel.org
References: <CALDQ5Nz+O13EOSi6RYHbFXTqJKB-S8BBs6K+MBO7-vPgquJYAw@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CALDQ5Nz+O13EOSi6RYHbFXTqJKB-S8BBs6K+MBO7-vPgquJYAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/25 19:05, James Addison wrote:
> Because reStructuredText does not provide lexical scoping rules for
> labels, resolution of targets that have duplicate declarations is
> ambiguous and produces nondeterministic output.
> 
> To improve the reproducibility of the HTML documentation,
> disambiguate two labels both previously titled "submit_improvements".
> 
> Version 2 of this patch is logically unchanged; a base-commit ref is
> added, and unintended word-wrapping is removed.
> 

Your patch did not make it to LKML because you sent it as HTML email.
Please resend (better use git send-email).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
