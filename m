Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E03D4107
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388138; cv=none; b=r8/tq8Yhz04vEv0EM+jHT8KJGWwGYR86B/QlwyfTg6vYhMDhfsGD/JObqDCpeurrGHbtchfPJm7WnmrgU16NpEdSoyDWyFd98LPGuvTAPVriYztJ4IoqQ3b7Gq7p9nemplvPmyo7TDQUuDFY7KFfotb/8zIpBd4aVJ9tMuRPJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388138; c=relaxed/simple;
	bh=hSS7F9nJhRNe2bLPAXG7P4hIqvGIIZeN9p6yOCt6LeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsUc7AWsFysUhCyRfid8ayZNtgG0oVdBxZs+3cY0swM565awa4aURoPpdGFAECVQOrV4g4OWcISyjS09ptA6ePsUXxUJUg77hgPXO9Zuw/8BPObvUJ6eOcBBoM/VY3jD8m4JdgTCmBUBtzHUFaYLn6tuR2gY8dygMP+qN1IqVg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X5bFLf9u; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X5bFLf9u"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e5fe62fc87so108958a34.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779388131; x=1779992931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0XQG/6g75fgxZbBE/+qTXKYgHicOF73Gp8SX+DuZdw=;
        b=X5bFLf9uPPXGD7DA7hUoRkUeiysW+lFQ8cVsQW1UPXfx+7ox8nL5vCeVj9H3Xa5p39
         +mQvAeAKx8KBlmoRH+OYrORYpqu9q6SfWZ4SH5y3JafQYypp3tzug5dq8zTXocDstxa2
         Yz6ntNuNxiBZiCPxhinwNrebzL2/+BHNM1WSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779388131; x=1779992931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0XQG/6g75fgxZbBE/+qTXKYgHicOF73Gp8SX+DuZdw=;
        b=GlO13LmGR3iv8j+bIL4NhXT72C5Fl+OBe/oaK+5/litrU58DZWV2Vh1juBLL8pnGwG
         oaDzrxl0+jrruAIA8Nfa9K4R9aitkgeDM8MiSlbskxNxMWtVXQn+9t24C7yG/0gGqrww
         yE1ExhntlrEGOXCooQABJEg3ZJiL6PRwA7TZr7TaU63wUWA7KxoR8Wj0BGyG/mvVZ8tl
         pt0Rx/emp1YAg4ShnET4hALAwMy7AjXoMQxJGovOXyVHhCtln8/FIMWhCpEeDCB4Bvtt
         XootchCs4doaznc/FLei270Ajg1SEYwn3WCGNS2D5+jrUAVoN2ZP+ry/mwjAP9t1Fhvr
         x2/g==
X-Forwarded-Encrypted: i=1; AFNElJ9ax5LEM6q4pMoAMeF9K5wYjEzrz1aVUcklA0s+KOAB/K7mFf5nzHDRuWVc3bsjYKpRFX282OQGUME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCoC3ADBHKau73ChvJIBspKmnne51NciFDJRtt0TdmdLbYmlvs
	8T0OVj7hUwSDzUd0oXquz21T4VRTLQ2KMlpsHMNFuiS7LD4VxMaG0cmN/slg5e1UsoH/OBx2a4J
	jntC/
X-Gm-Gg: Acq92OHd6wFxo/hcWlK9FKcnAUbkwi+CTHFRPPeuUa5wHu6pMGrF8xkN05kBPt2CiUq
	nJ9O/Q5T9JWmV06/1PgXBTYFPiPei16LW9z+9iQm/uV/PVhwj3n+cZNLGut4eN8d8ij2x6SfafI
	NFRrLxPI2QYIxTdnBv6eWrXIyqGsTq/TWZob6nwK47lgY9A5k//r3oWYxJpC29gEqOQ5SFUty+1
	1OEBidRMJdSmYmp5q4x0JtITflKVMooYBCjFGhGGPKF2r+NlPWs55mrEy6H1OPGGVpDP2tvTnpA
	5augNxGZ37wkoBeprQMd186EYHyCPhGk1ArjikQJ1azRQPVLenQ7h1DRAY+kJFgh+sQip906AVm
	87COIHZqelVGCwe0J+X7vIVBaHex0eAG7lLv03XPvEUXHFIqjSdx9AGnO0kQ0OzPjfNt+q1zXh5
	dCzRkEjuDJkojZsER1HNjo/jMZq1fZ9H7cyDjb84lbsPCHPa+DxLqqfy5do3J743tLxMv6SJcj/
	mQdSbOgBxaWPp9jXrre7uUIpjVXnuHfaUIith9uhkm9VA==
X-Received: by 2002:a05:6830:6d0c:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7e5fed2964emr243419a34.5.1779388131456;
        Thu, 21 May 2026 11:28:51 -0700 (PDT)
Received: from [192.168.1.239] (207-181-222-53.s5939.c3-0.hnc-cbr1.chi-hnc.il.cable.rcncustomer.com. [207.181.222.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e5f6e78bf9sm930694a34.15.2026.05.21.11.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:28:50 -0700 (PDT)
Message-ID: <e81f9c62-b6ae-409d-a5a1-246bc7f9aa23@linuxfoundation.org>
Date: Thu, 21 May 2026 12:28:49 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: todo: fix spelling of "fucntion"
To: Godswill Onwusilike <onwusilikegodswill@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260516210141.42971-1-onwusilikegodswill@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260516210141.42971-1-onwusilikegodswill@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 15:01, Godswill Onwusilike wrote:
> Correct the spelling of "fucntion" to "function" in todo.rst
> documentation
> 
> Signed-off-by: Godswill Onwusilike <onwusilikegodswill@gmail.com>
> ---
>   Documentation/gpu/todo.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 841e4e986c48..7526ed31b0af 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -1001,4 +1001,4 @@ DRM driver that can run X11 and Weston.
>   
>   Contact: Thomas Zimmermann <tzimmermann@suse.de>
>   
> -Level: Advanced
> +Level: Advanced
> \ No newline at end of file

Hmm. the patch doesn't fix the spelling in the following line mentioned
in the commit log. Instead it removes and adds the same line.

"rename all inlined fucntions according to driver conventions."

thanks,
-- Shuah

