Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D66AB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 21:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753077AbeDPVsZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 17:48:25 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:42814 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753012AbeDPVsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 17:48:22 -0400
Received: by mail-wr0-f194.google.com with SMTP id s18so29992464wrg.9;
        Mon, 16 Apr 2018 14:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7bsUt7GMrIXraQHWvY2Gu2e5r5BziJOhlXEQMBmeK0E=;
        b=E8smusHDRNojOeM+r8GEyKVlzKVtoCSJRrNvkMnHOLyNcX/Pvkhwu/47J9pRIhNcLs
         C2K+//Y3lZe1NiMiYXB76SqBbAd19Pskw1OvjCG8yg/R46p8xOU3e3MkzxPinvnTpLg/
         aAamvfKbDo33xU7rVBtfwPn4uusABzEqHXyjrcybQIRwNa5+AYO8dUn0GAJqCEPfV8Vz
         BvrTFLSKH71BqO/s78Xy1LPr59wgDv3juoC+6XGKv7rdALt5u22HLrdevzyWoJZq9j+b
         Vp39BnBWh4XXwXvp3yb0Rv9dGQmQRiZDBHnG+dlLSQR1GnXSWUnm7vMtFawuk3TdKhDH
         jkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7bsUt7GMrIXraQHWvY2Gu2e5r5BziJOhlXEQMBmeK0E=;
        b=LuZU++stVJe9I/YAvHX4sE0x1e34lQ115vZmSQAn9kqi5X6BE5nD9nVWAkTYvSFiD0
         +cY9DdZusoT99N/S/BLJjDol0WApI3lM2uyL3386Q3Ge3iIsmzWOAUX0u7jF3D2975cu
         gShrAzzrNGUvUvE7wc08gkLnb4FCrc4CN8asWSyC9i5PhYxOGb21+QsNkgwNhIKvZZRW
         KbDrkImJYmr1RonTdu78z8HloVqAExeg0kV6xAhJSeL47Mvs3WgeDZ57/Y8n/610gxJ6
         XhVdZSE3rgZYE3rBrZ5u9wZwNF3DYhzEAAO5Wr/ikFOVmvlWLf2+dq1ltnVvPK39kKvh
         bUQA==
X-Gm-Message-State: ALQs6tCJqCYbcJ/rWn5jgidGN7Jqd8iTK+1euvLal/rieVEmzCHxy1jj
        3chcEDAO5gDOcvfar1hH66X+4qz9tC8=
X-Google-Smtp-Source: AIpwx4+dhIeiRsRjO1KSCxFfZhNH21+ebtdi28YewDjXNgc22IXOlgBqO8eIXRHOQkdezZyfyidIoQ==
X-Received: by 10.80.179.45 with SMTP id q42mr34556815edd.264.1523915301224;
        Mon, 16 Apr 2018 14:48:21 -0700 (PDT)
Received: from thinkpad (524A8B4B.cm-4-3c.dynamic.ziggo.nl. [82.74.139.75])
        by smtp.gmail.com with ESMTPSA id q30sm4197421edc.17.2018.04.16.14.48.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Apr 2018 14:48:20 -0700 (PDT)
Date:   Mon, 16 Apr 2018 23:48:18 +0200
From:   Thymo van Beers <thymovanbeers@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-parameters.txt: Fix whitespace
Message-ID: <20180416214602.GA11295@thinkpad>
References: <20180416154458.GA24716@thinkpad>
 <20180416140846.0effe6ad@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180416140846.0effe6ad@lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 16, 2018 at 02:08:46PM -0600, Jonathan Corbet wrote:
> On Mon, 16 Apr 2018 17:45:01 +0200
> Thymo van Beers <thymovanbeers@gmail.com> wrote:
> 
> > Some lines used spaces instead of tabs at line start.
> > This can cause mangled lines in editors due to inconsistency.
> > 
> > Replace spaces for tabs where appropriate.
> 
> Seems like a fine idea.  The patch doesn't apply, though; can you please
> make a version against current docs-next?  (Or against 4.17-rc1 will work
> too).
> 
> Also...
> 
> >  			domain
> > -			  Isolate from the general SMP balancing and scheduling
> > -			  algorithms. Note that performing domain isolation this way
> > -			  is irreversible: it's not possible to bring back a CPU to
> > -			  the domains once isolated through isolcpus. It's strongly
> > -			  advised to use cpusets instead to disable scheduler load
> > -			  balancing through the "cpuset.sched_load_balance" file.
> > -			  It offers a much more flexible interface where CPUs can
> > -			  move in and out of an isolated set anytime.
> > -
> > -			  You can move a process onto or off an "isolated" CPU via
> > -			  the CPU affinity syscalls or cpuset.
> > -			  <cpu number> begins at 0 and the maximum value is
> > -			  "number of CPUs in system - 1".
> > +				Isolate from the general SMP balancing and scheduling
> > +				algorithms. Note that performing domain isolation this way
> > +				is irreversible: it's not possible to bring back a CPU to
> > +				the domains once isolated through isolcpus. It's strongly
> > +				advised to use cpusets instead to disable scheduler load
> > +				balancing through the "cpuset.sched_load_balance" file.
> > +				It offers a much more flexible interface where CPUs can
> > +				move in and out of an isolated set anytime.
> > +
> > +			You can move a process onto or off an "isolated" CPU via
> > +			the CPU affinity syscalls or cpuset.
> > +			<cpu number> begins at 0 and the maximum value is
> > +			"number of CPUs in system - 1".
> 
> This would appear to have changed the indentation of some of the text?
> 
> Thanks,
> 
> jon

Thanks for the comment.

I will rebase against docs-next. Hadn't realised my tree wasn't
up-to-date.

Upon reviewing that section I see that was intentional indentation and
not some tab/space mix up.

Both will be fixed in v2.

- Thymo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
