Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eCPvVuKU"
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D42319BB
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 08:38:27 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7b05e65e784so15042139f.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 08:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701448706; x=1702053506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4bReDtBqdZ7CQBg8UmEdVvEuIGOtXfeTpzV766B0GQ=;
        b=eCPvVuKUtcUML6PCcMRbRoVs9nIim4eBXq2DOUW6ltIoOSMN0LBgO83FAf+eQdrBDq
         A/PmkuhmUd7P/48s+UEf27F2Mcv2+uZTPpLM6X1n6JWoCdpMkNuT4GtaZDIrhfzxjz/p
         M4x1KAD0TWPjWfqQjKrbI4r6eByvIohNQ8quo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701448706; x=1702053506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4bReDtBqdZ7CQBg8UmEdVvEuIGOtXfeTpzV766B0GQ=;
        b=qtBAysXJfD23/dpEwFVU/8wH0NVz1+L2kxUdx49qezCOiQj2VZr3Z8ZGbY1NhCIeEE
         2Pe6hJzy0dcpM7kVKhdTykhAKiKDi8XmVbl74Rx7JGJ/cWztP2J7yLxNsGdRASgFs7eC
         4jpwdPmuX9+CfTqm/Q2hxtn4rCwdNqr6c0UOcZm/BttW/cIEyKywggkPgIAIKKuAmc2H
         sCI/ndS4ERhVYiMoOcIQUDURYJAaCS3ExQ/eSdFGcrAL8UQYAWH/nZoPjM0H0kt/cMek
         44HwB0TQEmj73BaP5AIBN566eC/MUKNMuZaVqlW23stZF7qAol1yN9aywrX0YuYsYKun
         AnnQ==
X-Gm-Message-State: AOJu0YyquID4B/t4LGyexthPRrmhXk+08RlINYtuwIv3PyaBW41C/DtM
	Q5Xf0vVyrBSR6/cmU/AKgKBZRA==
X-Google-Smtp-Source: AGHT+IHG40EFSnt4Yz6Knhpd28geD95aKAGL4h+gRV294CYt5W7hXqom/+d8jZtbFp7xj3MCvp4Ghw==
X-Received: by 2002:a05:6602:489a:b0:7b3:95a4:de9c with SMTP id ee26-20020a056602489a00b007b395a4de9cmr22727490iob.1.1701448706259;
        Fri, 01 Dec 2023 08:38:26 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id u1-20020a6be901000000b007b3e503d59csm1046219iof.47.2023.12.01.08.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 08:38:25 -0800 (PST)
Message-ID: <8b95b96c-6aeb-4bf0-8ee9-2ba62330c672@linuxfoundation.org>
Date: Fri, 1 Dec 2023 09:38:24 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] selftests: livepatch: Test livepatching a heavily
 called syscall
Content-Language: en-US
To: Marcos Paulo de Souza <mpdesouza@suse.de>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>, Shuah Khan
 <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20231031-send-lp-kselftests-v3-0-2b1655c2605f@suse.com>
 <20231031-send-lp-kselftests-v3-3-2b1655c2605f@suse.com>
 <f9d82fa6-08d7-4ab6-badc-691987b37a82@linuxfoundation.org>
 <unpg4z7eig6qbudgulnr6sog65fq7s2dy4u2vp2dgkdrq5csdw@dltnxuw6kw5b>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <unpg4z7eig6qbudgulnr6sog65fq7s2dy4u2vp2dgkdrq5csdw@dltnxuw6kw5b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/23 06:13, Marcos Paulo de Souza wrote:
> On Thu, Nov 30, 2023 at 04:24:26PM -0700, Shuah Khan wrote:

>>
>> Missing module name? Is there a reason to not name this module?
> 
> Can you please elaborate? This new module use the same MODULE_ macros used by
> the current livepatch selftests. What do you mean by module name?
> 

Pre-commit checpatch script spdx check complained about the module name.
Please run it to see the message.

thanks,
-- Shuah

