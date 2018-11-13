Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36FC87D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 17:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbeKNDxP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 22:53:15 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43643 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731625AbeKNDxP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 22:53:15 -0500
Received: by mail-wr1-f66.google.com with SMTP id y3-v6so14309529wrh.10
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 09:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/UQjNl9KMYOO2L/Btjnus7YePUZ4dnRxDDZ4QOFJ+4Q=;
        b=RwoGukJJ7K/gZSt1+7JVUvI3S4b7QqodpFcNlk4KWLoTAHsfD+7zFrfMXBRT2KUp59
         gmmc8Mwn2I91WRjCnL5QxXqgapAXgG9n+I5bljScvf4yFYSXXn7GxZIf4pJWI4rj60Gu
         CikS/N9nWD+xRVUir63QNA8LGtTC6vAjqY2M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/UQjNl9KMYOO2L/Btjnus7YePUZ4dnRxDDZ4QOFJ+4Q=;
        b=FI0G3CMFA5cLggIakUg5ZDDKVRw7JGCVWqEmDbAB+onsH9dimDYa33vEca1D0novnz
         5KhQqU4LWlsQf91r/Byc68W3UjjvbOoAOccRjTQ2KSLo5qGBq3ngJQHrRwjE4cI2K2LW
         WQ86QWULp5SNapWfr5/da0K7inF1KGjte02qIdnjYBj6JBI401rhLjvGoIFRWqlZxX1F
         dMHM5ZC+vN5hIwFVpL0vhki0gvuefXnOPhaHSyITIyQqvh5d5hfFz0n3Td8gFWy+lbnZ
         Mcg5pMMGfBTrj45/Es2wY0B+Q4fcbanuDKJuzDWr7xihRDCp3joMZynQEv9vcE0wnVXo
         ZYfg==
X-Gm-Message-State: AGRZ1gJR8Sb69SvlUMD2eyn6hQCj2G11lIfVfol1hfSU+OOJcq42rVlh
        kL9tKZ/T+9CBNfuyvJJZ9TXRHg==
X-Google-Smtp-Source: AJdET5fGd69cAnQiv9zPmoRQwPq2c1CklzuciKUSYyExsZzkPQJ40RmSlVwE+qust4ExGWpLvpez/Q==
X-Received: by 2002:a5d:410e:: with SMTP id l14mr4220381wrp.61.1542131644683;
        Tue, 13 Nov 2018 09:54:04 -0800 (PST)
Received: from [192.168.43.112] ([37.180.154.12])
        by smtp.gmail.com with ESMTPSA id 125-v6sm15077606wmm.25.2018.11.13.09.54.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 09:54:04 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: [PATCH 01/12] kernfs: add function to find kernfs_node without
 increasing ref counter
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20181112122840.GA1429@kroah.com>
Date:   Tue, 13 Nov 2018 18:53:59 +0100
Cc:     Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, bfq-iosched@googlegroups.com,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <07A5F685-9D7D-42A7-9A10-73C658F47435@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
 <20181112095632.69114-2-paolo.valente@linaro.org>
 <20181112122840.GA1429@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.100.39)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Il giorno 12 nov 2018, alle ore 13:28, Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> ha scritto:
>=20
> On Mon, Nov 12, 2018 at 10:56:21AM +0100, Paolo Valente wrote:
>> From: Angelo Ruocco <angeloruocco90@gmail.com>
>>=20
>> The kernfs pseudo file system doesn't export any function to only =
find
>> a node by name, without also getting a reference on it.
>> But in some cases it is useful to just locate a kernfs node, while
>> using it or not depends on some other condition.
>>=20
>> This commit adds a function to just look for a node, without getting
>> a reference on it.
>=20
> Eeek, that sounds really bad.  So you save off a pointer to something,
> and have no idea if that pointer now really is valid or not?  It can
> instantly disappear right afterwards.
>=20

Hi Greg,
that function is invoked only in functions executed with cgroup_mutex
held.  This guarantees that nothing disappears or becomes
inconsistent.  That's why we decided to go for this optimization,
instead of doing useless gets&puts pairs.  Still, I'm not expert
enough to state whether it is impossible that, once we have defined
that function, it may then get used in some unsafe way.

So, I seem to see two options:
1) Add a comment on the function, saying that cgroup_mutex must be
   held while invoking it (I guess you won't like this one).
2) Do not define such a new function, and, in the other patches, use
   the already-available find_and_get.

Looking forward to your feedback (or of other knowledgeable people on
this issue) before proceeding to a rebased V2,
Paolo


> This feels wrong, what is the problem of having a properly reference
> counted object passed back to you that you have to create a dangerous
> function like this?
>=20
> greg k-h

