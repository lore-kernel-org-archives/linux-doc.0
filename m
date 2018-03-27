Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B69D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue, 27 Mar 2018 15:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752526AbeC0PCI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 27 Mar 2018 11:02:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34510 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751045AbeC0PCF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Mar 2018 11:02:05 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2RF0RVX080525
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 11:02:05 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gyqqu9w0d-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 27 Mar 2018 11:02:04 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 27 Mar 2018 11:02:04 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 27 Mar 2018 11:02:01 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2RF201E46399506;
        Tue, 27 Mar 2018 15:02:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5B1DCB204D;
        Tue, 27 Mar 2018 12:04:10 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.85.187.146])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 277B6B2046;
        Tue, 27 Mar 2018 12:04:10 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id B418516C0DA0; Tue, 27 Mar 2018 08:02:52 -0700 (PDT)
Date:   Tue, 27 Mar 2018 08:02:52 -0700
From:   "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To:     Will Deacon <will.deacon@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        okaya@codeaurora.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs/memory-barriers.txt: Fix broken DMA vs MMIO
 ordering example
Reply-To: paulmck@linux.vnet.ibm.com
References: <1522156287-15169-1-git-send-email-will.deacon@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1522156287-15169-1-git-send-email-will.deacon@arm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18032715-0008-0000-0000-000002EBA2DE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008753; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01009189; UDB=6.00514075; IPR=6.00788471;
 MB=3.00020270; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-27 15:02:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032715-0009-0000-0000-000038B2368E
Message-Id: <20180327150252.GN3675@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-27_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803270152
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 27, 2018 at 02:11:27PM +0100, Will Deacon wrote:
> The section of memory-barriers.txt that describes the dma_Xmb() barriers
> has an incorrect example claiming that a wmb() is required after writing
> to coherent memory in order for those writes to be visible to a device
> before a subsequent MMIO access using writel() can reach the device.
> 
> In fact, this ordering guarantee is provided (at significant cost on some
> architectures such as arm and power) by writel, so the wmb() is not
> necessary. writel_relaxed exists for cases where this ordering is not
> required.
> 
> Fix the example and update the text to make this clearer.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Reported-by: Sinan Kaya <okaya@codeaurora.org>
> Signed-off-by: Will Deacon <will.deacon@arm.com>

Good catch, queued on my lkmm branch, thank you!

							Thanx, Paul

> ---
>  Documentation/memory-barriers.txt | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index a863009849a3..3247547d1c36 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -1909,9 +1909,6 @@ There are some more advanced barrier functions:
>  		/* assign ownership */
>  		desc->status = DEVICE_OWN;
> 
> -		/* force memory to sync before notifying device via MMIO */
> -		wmb();
> -
>  		/* notify device of new descriptors */
>  		writel(DESC_NOTIFY, doorbell);
>  	}
> @@ -1919,11 +1916,15 @@ There are some more advanced barrier functions:
>       The dma_rmb() allows us guarantee the device has released ownership
>       before we read the data from the descriptor, and the dma_wmb() allows
>       us to guarantee the data is written to the descriptor before the device
> -     can see it now has ownership.  The wmb() is needed to guarantee that the
> -     cache coherent memory writes have completed before attempting a write to
> -     the cache incoherent MMIO region.
> -
> -     See Documentation/DMA-API.txt for more information on consistent memory.
> +     can see it now has ownership.  Note that, when using writel(), a prior
> +     wmb() is not needed to guarantee that the cache coherent memory writes
> +     have completed before writing to the MMIO region.  The cheaper
> +     writel_relaxed() does not provide this guarantee and must not be used
> +     here.
> +
> +     See the subsection "Kernel I/O barrier effects" for more information on
> +     relaxed I/O accessors and the Documentation/DMA-API.txt file for more
> +     information on consistent memory.
> 
> 
>  MMIO WRITE BARRIER
> -- 
> 2.1.4
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
