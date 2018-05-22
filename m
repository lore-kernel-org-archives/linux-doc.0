Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 169A87D08C
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753234AbeEVWwG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:52:06 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:40756 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753036AbeEVWwF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:52:05 -0400
Received: by mail-oi0-f65.google.com with SMTP id c203-v6so17780478oib.7;
        Tue, 22 May 2018 15:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nTHTR2+9eFbNHaK7jVialz5pvYXUwSCTOmnPjqSY64k=;
        b=FpltDTxCGPfhCBW8+bE4xRTA4kAMlln3j3t3y50oGOmF+R4YvqtyXsTxy0SSFqovtR
         bs+NkUoPOpx8K1lNPjDXe96gb/pQ0rP47Iwr5nEBgVeajRIDn8/4i6DwPbcYOh1i2CxD
         o0sl5Dfl8ynYDINcOWpE88XIzEJgI6QvcrxBExnnAmW4xzuT/9RrGfMo99+gZ2+HRaD5
         HzTNo4jIvT4bpuJ0KIjyya03fVa5/RLAF3rKlNhLuHTH+RN+vRO5NsJMoeGEaYZ/woJ0
         Mp8FBKf4Bw9z3ygKZ7lUrLg6xO9S1vEKrHlRndC0k9Ga4wFpGYzv0+i6v9jxDZIwMTat
         T+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nTHTR2+9eFbNHaK7jVialz5pvYXUwSCTOmnPjqSY64k=;
        b=UvnOp2TAzuG78TDCE3qpZjxNnUxaloLwKoEUMBijhk4qsDiK5feIIdq6/5/Hs+7tVT
         dDcDnwyB9FV//g28jcgYnPnu3IKy5Nm1U0mBN3Zp0Qs3Ubw05jpl36k44ggKsgho8HNp
         fl0FYw9Tg8ZhlYpiC3/TDbMFzp04TSbYq12kMPYjAZpveZkxKVi54beXuIRmM4/xAE5D
         5Djw5brmLOXF5EthkSZtlieKf1gkovRtKLIiH+KBek+p7r2cePjQVoCsuyMGHr4GayyK
         IWbvVoiakMlT90OXhoKeTQMfxgizEqbGgeLZ9UaIFF/8VINPE1Mg3+cEWSV6yAu0jwx1
         4NFA==
X-Gm-Message-State: ALKqPwfQjFFDQ9oKD2JODRiK/BtmE+MfjcTr7kspKFXdXYT5nyJsLT6x
        voC1w7khQ6xNeNC4sufW2Ng=
X-Google-Smtp-Source: AB8JxZomvtvXW4W9EmQo5uEWSnUtdO3qpyiFejU+46g9myDjtUvi2S1SxWEMu0FbterTx/tBdbX+Fw==
X-Received: by 2002:aca:2b13:: with SMTP id i19-v6mr204563oik.292.1527029525139;
        Tue, 22 May 2018 15:52:05 -0700 (PDT)
Received: from nuclearis2_1.gtech (c-98-201-114-184.hsd1.tx.comcast.net. [98.201.114.184])
        by smtp.gmail.com with ESMTPSA id r48-v6sm15625400otb.51.2018.05.22.15.52.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:52:04 -0700 (PDT)
Subject: Re: [PATCH 5/5] Documentation/PCI: Add details of PCI AER statistics
To:     Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>
Cc:     rajatxjain@gmail.com
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-6-rajatja@google.com>
From:   "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <cffe5b81-a05c-a249-8c36-70a9c4d61e7f@gmail.com>
Date:   Tue, 22 May 2018 17:52:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180522222805.80314-6-rajatja@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/22/2018 05:28 PM, Rajat Jain wrote:
> Add the PCI AER statistics details to
> Documentation/PCI/pcieaer-howto.txt
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  Documentation/PCI/pcieaer-howto.txt | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/PCI/pcieaer-howto.txt b/Documentation/PCI/pcieaer-howto.txt
> index acd0dddd6bb8..86ee9f9ff5e1 100644
> --- a/Documentation/PCI/pcieaer-howto.txt
> +++ b/Documentation/PCI/pcieaer-howto.txt
> @@ -73,6 +73,41 @@ In the example, 'Requester ID' means the ID of the device who sends
>  the error message to root port. Pls. refer to pci express specs for
>  other fields.
>  
> +2.4 AER statistics
> +
> +When AER messages are captured, the statistics are exposed via the following
> +sysfs attributes under the "aer_stats" folder for the device:
> +
> +2.4.1 Device sysfs Attributes
> +
> +These attributes show up under all the devices that are AER capable. These
> +indicate the errors "as seen by the device". Note that this may mean that if
> +an end point is causing problems, the AER counters may increment at its link
> +partner (e.g. root port) because the errors will be "seen" by the link partner
> +and not the the problematic end point itself (which may report all counters
> +as 0 as it never saw any problems).

I was afraid of that. Is there a way to look at the requester ID to log
AER errors to the correct device?

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
