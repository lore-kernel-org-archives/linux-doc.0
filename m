Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49217E4
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="SGZe1AfU"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C54B7
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 19:27:01 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so824624a12.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1697077620; x=1697682420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uAVbdAI/t4kp4F0w7o3XfjGK/x3xwElaYSG4Wap1s0=;
        b=SGZe1AfUk0omF01bhlOoqzan1SZglYgEK5f0qkT2MBckNIayIYVb1mqNJfgJx1ZeKN
         0z9nM6GW998cDVX2c3uGqd82ToPSR22Q054CC1Fk0fkTF5KQqBbypONRlT+pWGQCV4kd
         ZdchkeLjM0DqoD4uxDHpkW3O3+XJy0pS8Lv6dxbSRZfEt3nI5EibJYpYXGukIxt8xRAe
         SdVOjI44RBSfSeT/Gb8gfhkcg3AsmIi+rd6XgN0L0vvA55ulCJT9PFs5XZdaLMELNK6F
         uDgIABmIQ63JtXkeXvVNfWOyqqJw+NzwrEcvl1E6gLpDBkNK8ycUfGjRmEiPCXcPRwh+
         sSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697077620; x=1697682420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uAVbdAI/t4kp4F0w7o3XfjGK/x3xwElaYSG4Wap1s0=;
        b=AuIZV5S+++1gBTcRTboEvzjN2Mf718AYv+cgeWYxS/C2pNJClHdPP4L1jRJqV5Y+Rc
         Fg7SxZ9XWxWSi6tGUlKxBZTTebUNXkFjZF/WvTN3SDGYK38S67A6mPuE2umTYKEDdZir
         iYfsK+wWVr4ARVANLwNAnYfnIdQ59ndMMseCTYqxik2JWU7lmTliKQEJrVo+C2hL7Xfq
         WuCf03vPRjnHO0rAjfuYOc/p0F4eB/D4G5Q4mcHbI4j6hBgccUeLPqU/PwHD3ssYqvoU
         jPScdIgY/NzVNtXznqNgbV4I1CeLDrpRZYZkB07bKbbNY97fVkQ8Y51PCj8ZMEAyvgQv
         W0ug==
X-Gm-Message-State: AOJu0YwFPbHHbnVZjA5h27OU7CSjCyKypF4MGE1/+PJE3UuUp6gmhPJd
	ZbCPIIeQlAMFQOUzGqPijsSgE/zShNH2k3z2nlDuyw==
X-Google-Smtp-Source: AGHT+IEBboUS4cwn4e3Ys9mXQ4ZCkgfLdr7atTruR6S+lBb7qdwzHO/3JSrHZfVGLZdiOBdEoTiN3ePEBse1tsA5adw=
X-Received: by 2002:a05:6402:5194:b0:53e:395:59d with SMTP id
 q20-20020a056402519400b0053e0395059dmr726299edd.8.1697077620310; Wed, 11 Oct
 2023 19:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009100349.52884-1-yizhou.tang@shopee.com> <cf850508-498b-4748-955c-382906eff676@acm.org>
In-Reply-To: <cf850508-498b-4748-955c-382906eff676@acm.org>
From: Tang Yizhou <yizhou.tang@shopee.com>
Date: Thu, 12 Oct 2023 10:26:49 +0800
Message-ID: <CACuPKxm+YtdierSLCTiqn3qEcgexM6O7AwVQrgSGq5mz8bJDog@mail.gmail.com>
Subject: Re: [PATCH] doc: blk-ioprio: Standardize a few names
To: Bart Van Assche <bvanassche@acm.org>, houtao1@huawei.com, jack@suse.cz, kch@nvidia.com
Cc: axboe@kernel.dk, tj@kernel.org, corbet@lwn.net, 
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yingfu.zhou@shopee.com, chunguang.xu@shopee.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Thanks for your suggestion, I will fix it in the next version.

Thanks,
Tang


On Wed, Oct 11, 2023 at 8:05=E2=80=AFAM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 10/9/23 03:03, yizhou.tang@shopee.com wrote:
> > From: Tang Yizhou <yizhou.tang@shopee.com>
>
> The title of this patch is misleading. The title suggests that the
> user interface is changed, which is not the case. What this patch does
> is to bring the documentation in sync with the implementation.
>
> Otherwise this patch looks fine to me.
>
> Thanks,
>
> Bart.
