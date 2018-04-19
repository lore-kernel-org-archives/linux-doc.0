Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E9227E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 12:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753190AbeDSM6M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 08:58:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33258 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752617AbeDSM6K (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Apr 2018 08:58:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 554308182D1E;
        Thu, 19 Apr 2018 12:58:09 +0000 (UTC)
Received: from localhost (ovpn-200-19.brq.redhat.com [10.40.200.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD5DC2026DFD;
        Thu, 19 Apr 2018 12:58:06 +0000 (UTC)
Date:   Thu, 19 Apr 2018 14:58:04 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org,
        oss-drivers@netronome.com, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        John Fastabend <john.fastabend@gmail.com>, brouer@redhat.com
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
Message-ID: <20180419145804.4cf56574@redhat.com>
In-Reply-To: <62931080-6f69-3877-7a84-0df5be5754e6@netronome.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
        <20180417143438.7018-9-quentin.monnet@netronome.com>
        <20180418153448.574c6814@redhat.com>
        <67e84a95-5e7b-1c2c-e90f-7bcc0026bd10@netronome.com>
        <20180418174319.37f6c793@redhat.com>
        <62931080-6f69-3877-7a84-0df5be5754e6@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 19 Apr 2018 12:58:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 19 Apr 2018 12:58:09 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Apr 2018 13:44:41 +0100
Quentin Monnet <quentin.monnet@netronome.com> wrote:

> 2018-04-18 17:43 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>
> > On Wed, 18 Apr 2018 15:09:41 +0100
> > Quentin Monnet <quentin.monnet@netronome.com> wrote:
> >   
> >> 2018-04-18 15:34 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>  
> >>> On Tue, 17 Apr 2018 15:34:38 +0100
> >>> Quentin Monnet <quentin.monnet@netronome.com> wrote:
> >>>     
> >>>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> >>>> index 350459c583de..3d329538498f 100644
> >>>> --- a/include/uapi/linux/bpf.h
> >>>> +++ b/include/uapi/linux/bpf.h
> >>>> @@ -1276,6 +1276,50 @@ union bpf_attr {
> >>>>   * 	Return
> >>>>   * 		0 on success, or a negative error in case of failure.
> >>>>   *
> >>>> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
> >>>> + * 	Description
> >>>> + * 		Redirect the packet to the endpoint referenced by *map* at
> >>>> + * 		index *key*. Depending on its type, his *map* can contain    
> >>>                                                     ^^^
> >>>
> >>> "his" -> "this"    
> >>
> >> Thanks!
> >>  
> >>>> + * 		references to net devices (for forwarding packets through other
> >>>> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
> >>>> + * 		but this is only implemented for native XDP (with driver
> >>>> + * 		support) as of this writing).
> >>>> + *
> >>>> + * 		All values for *flags* are reserved for future usage, and must
> >>>> + * 		be left at zero.
> >>>> + * 	Return
> >>>> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
> >>>> + *    
> >>>
> >>> "XDP_ABORT" -> "XDP_ABORTED"    
> >>
> >> Ouch. And I did the same for bpf_redirect(). Thanks for the catch.
> >>  
> >>>
> >>> I don't know if it's worth mentioning in the doc/man-page; that for XDP
> >>> using bpf_redirect_map() is a HUGE performance advantage, compared to
> >>> the bpf_redirect() call ?    
> >>
> >> It seems worth to me. How would you simply explain the reason for this
> >> difference?  
> > 
> > The basic reason is "bulking effect", as devmap avoids the NIC
> > tailptr/doorbell update on every packet... how to write that in a doc
> > format?
> > 
> > I wrote about why XDP_REDIRECT with maps are smart here:
> >  http://vger.kernel.org/netconf2017_files/XDP_devel_update_NetConf2017_Seoul.pdf
> > 
> > Using maps for redirect, hopefully makes XDP_REDIRECT the last driver
> > XDP action code we need.  As new types of redirect can be introduced
> > without driver changes. See that AF_XDP also uses a map.
> > 
> > It is more subtle, but maps also function as a sorting step. Imagine
> > your XDP program need to redirect out different interfaces (or CPUs in
> > cpumap case), and packets arrive intermixed.  Packets get sorted into
> > the different map indexes, and the xdp_do_flush_map() will trigger the
> > flush operation.
> > 
> > 
> > Happened to have an i40e NIC benchmark setup, and ran a single flow pktgen test.
> > 
> > Results with 'xdp_redirect_map'
> >  13589297 pps (13,589,297) 
> > 
> > Results with 'xdp_redirect' NOT using devmap:
> >   7567575 pps (7,567,575)
> > 
> > Just to point out the performance benefit of devmap...  
> 
> 
> Thanks for those details! This is an impressive change in performance
> indeed.
> 
> I think I will just keep it simple for the documentation. I will add the
> following for bpf_redirect_map():
> 
>     When used to redirect packets to net devices, this helper
>     provides a high performance increase over **bpf_redirect**\ ().
>     This is due to various implementation details of the underlying
>     mechanisms, one of which is the fact that **bpf_redirect_map**\ ()
>     tries to send packet as a "bulk" to the device.
> 
> And also append the following to bpf_redirect():
> 
>     The same effect can be attained with the more generic
>     **bpf_redirect_map**\ (), which requires specific maps
>     to be used but offers better performance.

This sounds good to me! :-)

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
