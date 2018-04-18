Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D010F7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 13:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752659AbeDRNez (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 09:34:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50968 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752624AbeDRNey (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Apr 2018 09:34:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A436840201A1;
        Wed, 18 Apr 2018 13:34:53 +0000 (UTC)
Received: from localhost (ovpn-200-16.brq.redhat.com [10.40.200.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B75F52023594;
        Wed, 18 Apr 2018 13:34:50 +0000 (UTC)
Date:   Wed, 18 Apr 2018 15:34:48 +0200
From:   Jesper Dangaard Brouer <brouer@redhat.com>
To:     Quentin Monnet <quentin.monnet@netronome.com>
Cc:     brouer@redhat.com, daniel@iogearbox.net, ast@kernel.org,
        netdev@vger.kernel.org, oss-drivers@netronome.com,
        linux-doc@vger.kernel.org, linux-man@vger.kernel.org,
        John Fastabend <john.fastabend@gmail.com>
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
Message-ID: <20180418153448.574c6814@redhat.com>
In-Reply-To: <20180417143438.7018-9-quentin.monnet@netronome.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
        <20180417143438.7018-9-quentin.monnet@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 18 Apr 2018 13:34:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 18 Apr 2018 13:34:53 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'brouer@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Apr 2018 15:34:38 +0100
Quentin Monnet <quentin.monnet@netronome.com> wrote:

> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 350459c583de..3d329538498f 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -1276,6 +1276,50 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
> + * 	Description
> + * 		Redirect the packet to the endpoint referenced by *map* at
> + * 		index *key*. Depending on its type, his *map* can contain
                                                    ^^^

"his" -> "this"

> + * 		references to net devices (for forwarding packets through other
> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
> + * 		but this is only implemented for native XDP (with driver
> + * 		support) as of this writing).
> + *
> + * 		All values for *flags* are reserved for future usage, and must
> + * 		be left at zero.
> + * 	Return
> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
> + *

"XDP_ABORT" -> "XDP_ABORTED"

I don't know if it's worth mentioning in the doc/man-page; that for XDP
using bpf_redirect_map() is a HUGE performance advantage, compared to
the bpf_redirect() call ?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
