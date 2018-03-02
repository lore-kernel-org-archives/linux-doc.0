Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D53107E281
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 17:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1946099AbeCBRYH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 12:24:07 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:60614 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1945952AbeCBRYG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 12:24:06 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w22HMMAn096427;
        Fri, 2 Mar 2018 17:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2017-10-26;
 bh=1tAGiDWGwsbe42HaB5t2qu7PvysKpn5Dahqk6trCC0Y=;
 b=beDS/UF4J0C3SXUl7gy4n/XUZW8DwBtfBdSnCE5uWyZgfejpi+xey/wZnrIXpHo85Qhn
 PKrN5Q7LnLfRqEWAk53w/SDgvi7NzygJQgRgx7eaZe6/weM+2qywOte0bvOZ+3iC9ptP
 VpMejBkcUU5tfguLvVi3olH86FzQyW5sIFfwOJRQ4c7pd68LU2aOb26fBjng5dgxPEVm
 VPa7ydG8uHVCFjeXBO7WANzSKi98Kro2BNQ47amr9vC6fAp9lBfjf9Q2HamkOwGX9lM9
 2WYI8dIvOb/fdK8Djv+GuQs8uFzKqcvrJintXW5ZJILEU6Fu7WvrUFlNcqZLQS+bVaFY yA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by userp2120.oracle.com with ESMTP id 2gf4mhstjh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 02 Mar 2018 17:24:03 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w22HO2Y3001440
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Mar 2018 17:24:02 GMT
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id w22HO2dg009147;
        Fri, 2 Mar 2018 17:24:02 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 02 Mar 2018 09:24:02 -0800
Date:   Fri, 2 Mar 2018 09:24:01 -0800
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     Masanari Iida <standby24x7@gmail.com>
Cc:     linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] xfs: Change URL for the project in xfs.txt
Message-ID: <20180302172401.GT19312@magnolia>
References: <20180302133013.9744-1-standby24x7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180302133013.9744-1-standby24x7@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8820 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=8 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803020205
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 02, 2018 at 10:30:13PM +0900, Masanari Iida wrote:
> The oss.sgi.com doesn't exist any more.
> Change it to current project URL, https://xfs.wiki.kernel.org/
> 
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  Documentation/filesystems/xfs.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.txt
> index 3b9b5c149f32..4d9ff0a7f8e1 100644
> --- a/Documentation/filesystems/xfs.txt
> +++ b/Documentation/filesystems/xfs.txt
> @@ -9,7 +9,7 @@ variable block sizes, is extent based, and makes extensive use of
>  Btrees (directories, extents, free space) to aid both performance
>  and scalability.
>  
> -Refer to the documentation at http://oss.sgi.com/projects/xfs/
> +Refer to the documentation at https://xfs.wiki.kernel.org/
>  for further details.  This implementation is on-disk compatible
>  with the IRIX version of XFS.

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

>  
> -- 
> 2.16.2.345.g7e31236f652a
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-xfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
