Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="idNnUYi6"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328E4D71
	for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701269291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFzqrh0xCRuB2+k7XQGRqfBWGZI6cFLK12C66Jum2dE=;
	b=idNnUYi6G4FXVwbQiLDkt9dSajm2Oa8kNOeYcEuEJGlmTNUAhJm8M6rwpBBOM/0+aNT9Nz
	jA9I55xBOLOH1Wwhgw4rDSAgZAwqCByT4U2KRPaCPDUQRB1vvhU/gf2YQ59XTIdmkDfU31
	0ikHOQoOyCu46DiHtA6E+X0jkmz9dkU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-kJAvWlEDN-eEMsb7PP7-kg-1; Wed, 29 Nov 2023 09:48:09 -0500
X-MC-Unique: kJAvWlEDN-eEMsb7PP7-kg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67a36efeab4so44320426d6.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Nov 2023 06:48:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269289; x=1701874089;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFzqrh0xCRuB2+k7XQGRqfBWGZI6cFLK12C66Jum2dE=;
        b=ncS2zUrzCJWu5U0DMqiCHMv98IsxXox5V8zCoUe7Vt0Ya+sgsh/XDHjwtN+y/keg9i
         fuk12B90RXWYCXuXeq8HuaB9uCRUo3Co9FOEIwtB4G/HJT2p95AqSuM5mg+pQicVCTPy
         4OMmkmLa8EMOgQ7oh5Vwj8ieKJNIFFy4GepqKfRzwrTo38avyiNw2tOWkAWVk0/U7QIE
         aOfJDLVqNH5Od8sPWly8kv8cBQ/kMyGt0HO+kkoWLTxGkGCmi/+VZ2t7xQ4hAog70RAu
         9KU8UdcxUzZh70gdZvFSG9S2MQjKW/1RxdLZeX/RTbQ7sl4NrLoFnFqRyperwFzChqXM
         atVQ==
X-Gm-Message-State: AOJu0YwaaN+jP7OXBbpZ2WTPSbTdgzIp7PeWF3JK6tLTBr0ZZYMOeomg
	nCT+3rVlmwCaKENJs+tamK0f7AxmD7NaS/9509nSLTU9R35pKjHSx1r5uB4T3DTXFFGCfOeG1cg
	exElqD8pxc2XOGy2z9b87
X-Received: by 2002:ad4:4690:0:b0:66d:3716:4e14 with SMTP id pl16-20020ad44690000000b0066d37164e14mr13906373qvb.4.1701269289426;
        Wed, 29 Nov 2023 06:48:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR1J+F2tJR6UUsOb1ujw2zvaJBctB34SjfXwongFIrxqaUpUhB2SgOTZ7ODXSst5RgCPwkog==
X-Received: by 2002:ad4:4690:0:b0:66d:3716:4e14 with SMTP id pl16-20020ad44690000000b0066d37164e14mr13906356qvb.4.1701269289190;
        Wed, 29 Nov 2023 06:48:09 -0800 (PST)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id ea14-20020ad458ae000000b0067a33b921cdsm4059978qvb.42.2023.11.29.06.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 06:48:08 -0800 (PST)
Message-ID: <1f66c647-e51b-4640-cbff-67b17e2077ad@redhat.com>
Date: Wed, 29 Nov 2023 09:48:07 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Miroslav Benes <mbenes@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, attreyee-muk
 <tintinm2017@gmail.com>, jpoimboe@kernel.org, jikos@kernel.org,
 pmladek@suse.com, corbet@lwn.net, live-patching@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>
References: <20231127155758.33070-1-tintinm2017@gmail.com>
 <202dbdf5-1adf-4ffa-a50d-0424967286ba@infradead.org>
 <ZWX1ZB5p5Vhz7WD2@casper.infradead.org>
 <0e7941d8-d9b2-4253-9ad5-0f7806e45e2e@infradead.org>
 <alpine.LSU.2.21.2311291105430.12159@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH] Took care of some grammatical mistakes
In-Reply-To: <alpine.LSU.2.21.2311291105430.12159@pobox.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/23 05:08, Miroslav Benes wrote:
> 
> I am not a native speaker, but "step on each other's toe" sounds the best 
> to me. Or perhaps even "they need to be aware of each other and not step 
> on their toes" since it is then kind of implied? English is difficult :).
> 

Native speaker here, so don't ask me what's grammatically accurate :D  I
would definitely say "step on" vs. "step over".  I would also write
"each other's toes", but not flinch if I read "each others' toes" or
even "each others toes".

After thinking about it for more that 30s, I might consider rewording
the sentence to avoid the idiom altogether, something like:  "Therefore
they need to coordinate to avoid interfering with each other."

-- 
Joe

