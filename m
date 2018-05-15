Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBA647D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 10:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752725AbeEOK2z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 06:28:55 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41413 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752243AbeEOK2w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 May 2018 06:28:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180515102848euoutp01316da37268a01316c63e01b99e953d4e~uyqPbWiOO0627806278euoutp01-;
        Tue, 15 May 2018 10:28:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20180515102848euoutp01316da37268a01316c63e01b99e953d4e~uyqPbWiOO0627806278euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1526380128;
        bh=oIL8750qv+naJe3f5yxkIlnfYW8UrceiI9OhwLwbpJ0=;
        h=From:To:Cc:Subject:Date:In-reply-to:References:From;
        b=ZQE0F19CtHKZVs2HMPayyuu6sDbwB0TphGUu7ACEF9Z1OIXWLQktL9t4VAa8hDlA5
         IaJ3RgBaJxA2oQWL2091qkspQhh4FpDFCiObN2hE1fuQqS181FuRVS0yARidGWuzxH
         jnGB5zeLH/dRqJRLCcZeDI23/XHZhohYFtFODy+I=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20180515102848eucas1p28dc19937abd17db0fd7518aa377299e7~uyqO0t3s11896518965eucas1p2u;
        Tue, 15 May 2018 10:28:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B6.0B.05700.F56BAFA5; Tue, 15
        May 2018 11:28:47 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20180515102847eucas1p15466ad147e8836cad2dc3f2ef5044c79~uyqODIdRR1171811718eucas1p1x;
        Tue, 15 May 2018 10:28:47 +0000 (GMT)
X-AuditID: cbfec7f2-1dbff70000011644-97-5afab65f645c
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.EA.04183.F56BAFA5; Tue, 15
        May 2018 11:28:47 +0100 (BST)
Received: from amdc3058.localnet ([106.120.53.102]) by eusync1.samsung.com
        (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
        2014)) with ESMTPA id <0P8R008SPMFYDK60@eusync1.samsung.com>; Tue, 15 May
        2018 11:28:47 +0100 (BST)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@zh-kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 11/11] docs: fix broken references with multiple
 hints
Date:   Tue, 15 May 2018 12:28:46 +0200
Message-id: <9091975.Ce87WTtYpq@amdc3058>
User-Agent: KMail/4.13.3 (Linux/3.13.0-96-generic; KDE/4.13.3; x86_64; ; )
In-reply-to: <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUzMcRzHfX/PNWe/rugrZDvaYsqzfYd5mrXvbMbMmJuVq35i6uSui9oQ
        lTgkyiQPpSepIz06lZOOTtTRg5LcZZWHbMqO4oh0/bL13+v7+bw/3/d7n304UnqZ8eD2KiME
        lVIRKmOcqfJa+wufgPJf8gXaosXorLmOQG0pJTTqqU4AqKr+F4vSH5tpZMz8BFDLQD+DYrMK
        GfShQUegN6Z4gO4UZhEoZegmgW6cyKbQ08SvNCpJHwKo3TZIo+aKqwyKG56Nvp7pYlBmbjyJ
        ctoaCdRvO0Ug/bNMEjVVZxAo/sFjFhlOviNQi72RRC9emtk107Huug5gq8FI4ftpFhbHGd6w
        uLVyBy7Jm4uL808x+G1rFYPvDb6j8cNrOhZ3njYROCsxmcZnfgThoj49gfsNrxj8rdhzs4vc
        eWWwELo3UlDNX7XLeU9+rRGEx1CHBq78YWLALVILnDjIL4FltlJaC5w5KZ8HYGzTF1Z8fAMw
        TlvB/Fdl27oIB0v5XADvVu8TRb8B1HfHUo4Gwy+H5xPygYPd+GWwzvyEcYhIvpuFBeV3WUfD
        ld8E857YaQdTvBccTjWO1iX8HNiV3TH60WR+Ayw1JIy4cZwTHwQNxq2ixAX+TLaOSkh+JjQ8
        vEiLPA821N4BDi/IX+Rgp3kYiKnXw8aOZkJkV/jZVMqKPB02J5+mxIFYAAf1VWPLSAKwqlAq
        8gpoNDWOOUyCF8ovkY5AkJfAkyfGJBimlN0bG10LOxLPU+JWPgGY+7GHSAIz0sYFTxsXPG1c
        8AxA5gN3QaMOCxHUC5XCQV+1IkytUYb4Bu0PKwYjB/v8r8mmBwNNgTWA54BsokSfapdLaUWk
        OiqsBkCOlLlJKheNlCTBiqhoQbU/QKUJFdQ1YBpHydwl/t5H5FI+RBEh7BOEcEH1v0twTh4x
        wGWnvOHott5H5FLL5KH4A1a9pfO11S+wO91N6+3t1+S+vnQjs+nI4Qk1Sr+bfVNW2UG75lwk
        bTlUGbgoY3VUi6t/oq5oVqpPXz1+r50VYXG61VP30XN35HbfYw2tt21eW2Jcy3oPCMevsFPX
        RfsVWEH06oLvbZqEicHUlpJ2LZsjo9R7FAvnkiq14h+P7D7vrAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHed7bXofDVzN6sEgYCSWkJqFPERb0oYcgMNIPGpRDX6bpVDaV
        7EteM68UW6Ar05x3zeVd017NeW0685Kilcoy0SAVTUvTzGmB337nnN//nC+HJe2+Uw5sSHgU
        rwyXhUkZMWX80zNy+nbDpr9bf4YtyjT1EWhcU0uj2fYUgFr7N0Uor9NEI0PBPECja0sMStTp
        GTQ3UEmgyZ5kgKr0OgJptkoI9OJBIYV6s5ZpVJu3BdDEyjqNRl4/Y1DSzgm0nGFmUEFxMomK
        xocItLSSSqCmdwUkGm7PJ1Dym04REh7OEGh0Y4hEg+9NokvHcOXzSoCnBAOFm7WfRThJmBTh
        sRY/XFvqjGvKUxn8aayVwY3rMzRuy60U4en0HgLrstQ0zvgZiKsXmwi8JHxg8GrNcW9bf/GF
        ID4sJIZXunoFiIPLuw0gMo66u/Z0m4kDZWQasGIhdxYWrpiJNCBm7bhCAHO/1VP7xTaAxmE9
        ZbEY7jx8nFIOLGzPecA+UxdjkUjuqwgmqlv2Boe4a1C/OiGyMMU5wZ1swx5LuFPQXPhxb9Fh
        7iqsE1IIC1txgbC61UzuX5sHcHsp/V/AFv5ST+0FSM4RCm1P6H12hvrmHuIRsNEe0LQHNO0B
        LR+Q5cCej1Yp5AqVu4tKplBFh8tdAiMUNWD3CRq6N+qaQNrijQ7AsUBqLWnK3vC3o2UxqlhF
        B4AsKbWXtLjvtiRBsth7vDLitjI6jFd1gKMsJT0iGXSL9bfj5LIoPpTnI3nl/ynBWjnEgfz6
        KwkRpazRN8d02dpt9I7OxfucWK+ZHLbtNeYsL8zOm31cNRejmbIKpKw7aWysf+UlF6gtq+Yv
        HjeDTfedfK8XG2ZChZEutfDjd/wyj/1iEhYC5jx1jS+D3lrb0PYlAxKjKb5qMMo1M2d9uijY
        04e9ZRpfna6IrZqcc/SVUqpg2RlnUqmS/QUogIluAAMAAA==
X-CMS-MailID: 20180515102847eucas1p15466ad147e8836cad2dc3f2ef5044c79
X-Msg-Generator: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180509131942epcas2p3b11ff686acaa5e3d9afedef1a2a03aa7
X-RootMTR: 20180509131942epcas2p3b11ff686acaa5e3d9afedef1a2a03aa7
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <CGME20180509131942epcas2p3b11ff686acaa5e3d9afedef1a2a03aa7@epcas2p3.samsung.com>
        <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wednesday, May 09, 2018 10:18:54 AM Mauro Carvalho Chehab wrote:
> The script:
> 	./scripts/documentation-file-ref-check --fix-rst
> 
> Gives multiple hints for broken references on some files.
> Manually use the one that applies for some files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> # for fbdev part

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
