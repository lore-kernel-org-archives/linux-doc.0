Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 186FE7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 Aug 2018 01:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbeHXFXc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 Aug 2018 01:23:32 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:45042 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725735AbeHXFXc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Aug 2018 01:23:32 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w7O1iiRY174377;
        Fri, 24 Aug 2018 01:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=VDPICrBwfqHs5/mR+Wfl2tHE/I00m67dHtDzlcSXuM8=;
 b=qhTG3tZPmPc0IwVxZtZeMQI/LfjZcZ4nang+Y5V+uHzWq1dAjyaB+kROoU4S7fdkh/ZJ
 sSMixo6ldtdaViiCjSY3QTyK7xuK9mrWixGrRUG5UZJ/KwEGx04PiLWbEDy+BOJ6AJGs
 jK3ZQWzF/a3P77zTWTVEuXm/7Hk1qclWsDpfM5rAxhHMJHBzVSgZwb6DIPjbbxxNkIuQ
 vOHryaoRB/Xkud24Ha68vpmnMPNwXGrsws9qfBtrNvEJ7nZ4OSMeg0koJkKj/cnq14Ad
 LOPUCl/GKxntJ1Zw2R/ImBJmiUh/RQaJSc6pfaYv4MD35Vbb3ZHnsuu6touJuhU+Ig14 5g== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
        by aserp2120.oracle.com with ESMTP id 2kxbdqchb8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Aug 2018 01:51:06 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id w7O1p4T2020686
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 24 Aug 2018 01:51:05 GMT
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w7O1p4S4009458;
        Fri, 24 Aug 2018 01:51:04 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 24 Aug 2018 01:51:03 +0000
To:     John Pittman <jpittman@redhat.com>
Cc:     corbet@lwn.net, martin.petersen@oracle.com,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH] scsi: documentation: add scsi_mod.use_blk_mq to scsi-parameters
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20180823194918.25708-1-jpittman@redhat.com>
Date:   Thu, 23 Aug 2018 21:51:01 -0400
In-Reply-To: <20180823194918.25708-1-jpittman@redhat.com> (John Pittman's
        message of "Thu, 23 Aug 2018 15:49:18 -0400")
Message-ID: <yq1tvnka5x6.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8994 signatures=668707
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=808
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1808240017
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


John,

> Kernel line argument scsi_mod.use_blk_mq is missing from file
> Documentation/scsi/scsi-parameters.txt.  Add this option,
> providing mention of config setting and format.

Applied to 4.19/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
