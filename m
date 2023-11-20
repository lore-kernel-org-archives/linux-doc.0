Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GeZBjfg2"
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BB3B4
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 07:35:00 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ce2b6b3cb6so2811266a34.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700494500; x=1701099300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/g2rj348QGTaMUoHfAitiDG5ZGAAe3AXrQUt05vFuko=;
        b=GeZBjfg2nIo1ZytF+4ndL+wFIZvPeDVWQHvWMaktOXyT5IMI/9nx9o8A0o7VB0OI6z
         Zr+CCaHURd1B7wTQ1VRNxKD1ZVj0EyyQcDCGMYnZ3ms9OMCuIC4JELEWu7eIp33KoU9f
         meeALvkxWqMBolyPs8NA5ZnQFvqFLI28rp+kRmPpl4qE6Q98X5EwqgC+xO38zE6ndrLp
         iEbJ+lXP5SEbkYAHXKkoOHpiPc1JVldH4Wq0swCrDm788u4XpMy8RQyzW4w6G0Kwbd3e
         E2B/H+dLO392YHZiIPXzI7rUtYo496DtWijYRGLKjH5PVY1rl6jtRRfQB5XNPAWdh17m
         5pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700494500; x=1701099300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/g2rj348QGTaMUoHfAitiDG5ZGAAe3AXrQUt05vFuko=;
        b=spsDoK/ws2V3bUsoNayKJdcu8kCSTB28ZypSFXHUaxCUx+fY6+M/CfCA0z7A66LxEy
         I7dEJK3/yllze8DEgugznVx8OgKUGuNmOVhV+CCgil8ILZBsxDUnG1R5sgXVtCWA4Mvl
         94gKpNgrsZUVict+rRYxAruJ7gO/I2K2PEV5FWPnrMYmzXmsUPlKvueiPTb2zy3tOOaS
         hCnUC2U8P4c2AXMdoNSk45ZB/gj8cX3ROptCpWCwLb/l44sZNQ/JQZ7q+YjjynTv6axF
         h4O8oRJAsa6yx8qn7rFNhqszHDq+AqtvFNyhnaU/HGDwNht6X4HjSgE3tn49jyV0Qn3C
         oNGw==
X-Gm-Message-State: AOJu0YwLDt4X79DatNnSH15XVd/OGPGJ2yUJ1dpLYiHMv9Ve8eK4QIBi
	8kwea6ovm79tAl5nCgIdLAfvVXQKBDlVuOM6D25wBA==
X-Google-Smtp-Source: AGHT+IEb/1/SLpzTzhneVYblRJrocGEMu2RdIxrcZxKtNKLCJyFuPBDDmOa2CJDUAEm6395K+9ibzZoeZAOLMtUfDtg=
X-Received: by 2002:a05:6359:2eaf:b0:16d:bc40:3055 with SMTP id
 rp47-20020a0563592eaf00b0016dbc403055mr6273826rwb.19.1700494499834; Mon, 20
 Nov 2023 07:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103061715.196294-1-sumit.garg@linaro.org>
 <CAFA6WYNW_cAFVMTpqPQjwBASKDp_b=CpccCzx23jHn_+qoJrDQ@mail.gmail.com> <87y1es5xsd.fsf@meer.lwn.net>
In-Reply-To: <87y1es5xsd.fsf@meer.lwn.net>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 20 Nov 2023 21:04:48 +0530
Message-ID: <CAFA6WYN7ZB0Sgc0gB1rQhhirjoOEeyp2Uokzpwy-KFQ_aJQEVg@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: Destage TEE subsystem documentation
To: Jonathan Corbet <corbet@lwn.net>, jens.wiklander@linaro.org
Cc: vegard.nossum@oracle.com, Rijo-john.Thomas@amd.com, balint.dobszay@arm.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Nov 2023 at 19:31, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Sumit Garg <sumit.garg@linaro.org> writes:
>
> > Hi Jonathan,
> >
> > If you are fine with this destaging TEE documentation patch then will
> > you be picking up this patch? Or would you like Jens to pick it up
> > with your Ack?
>
> I'm happy to pick it up.

Thanks.

Jens, can we get your ack here for Jonathan to pick it up?

-Sumit

>
> Thanks,
>
> jon
