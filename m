Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F0C8CA
	for <linux-doc@vger.kernel.org>; Mon,  1 Jan 2024 00:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kcWfs2K1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BVNvnuW014749;
	Mon, 1 Jan 2024 00:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=SFj4HSMW+Yiw7GLejX5dJ6VtsMiI54lOkiG9zETtGGE=;
 b=kcWfs2K1sUwnvu+tiubRn9Cjwmf8Dcotw1f3G4eD/aDvWsJmso0SfxuaYXLD/0UdkUFR
 LgcoQYaLkuq0ljTK9cC3AYAgxPmIgSDi0B2aao5L+JT1+mRlQo7WAq8CClRdKX6gIfi8
 x+bWU3CE1YfClpJ8wLM4inpwY1qeVA3wnosB83+TmgqtRemMsnrwJ1SvNznudS+HWtKy
 AXN3atMfny/cQn+mF20AinEeRz02S17uM48GJz+XfaBdzmC4jQ5xOF66Gh/tbaQBFAnI
 18QmepnRcwNgHQ8GSy0k0F5FHT7QU2qKhPdSFCaEeZLDjNheXDYmDzUwRATP/tjX4wxh 7Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vaa03sc66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jan 2024 00:00:09 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3BVJnIUM001741;
	Mon, 1 Jan 2024 00:00:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3va9n4xcmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jan 2024 00:00:08 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 401007oV021824;
	Mon, 1 Jan 2024 00:00:07 GMT
Received: from localhost.localdomain (dhcp-10-175-57-83.vpn.oracle.com [10.175.57.83])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3va9n4xchr-1;
	Mon, 01 Jan 2024 00:00:07 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
        Jani Nikula <jani.nikula@intel.com>
Subject: [RFC PATCH 1/2] scripts/get_abi: fix source path leak
Date: Mon,  1 Jan 2024 00:59:58 +0100
Message-Id: <20231231235959.3342928-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-31_14,2023-12-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312310198
X-Proofpoint-ORIG-GUID: 26CvWrmEAreiF779diPcuPZgQF0XnY-n
X-Proofpoint-GUID: 26CvWrmEAreiF779diPcuPZgQF0XnY-n

The code currently leaks the absolute path of the ABI files into the
rendered documentation.

There exists code to prevent this, but it is not effective when an
absolute path is passed, which it is when $srctree is used.

I consider this to be a minimal, stop-gap fix; a better fix would strip
off the actual prefix instead of hacking it off with a regex.

Link: https://mastodon.social/@vegard/111677490643495163
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/get_abi.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_abi.pl b/scripts/get_abi.pl
index 0ffd5531242a..408bfd0216da 100755
--- a/scripts/get_abi.pl
+++ b/scripts/get_abi.pl
@@ -98,7 +98,7 @@ sub parse_abi {
 	$name =~ s,.*/,,;
 
 	my $fn = $file;
-	$fn =~ s,Documentation/ABI/,,;
+	$fn =~ s,.*Documentation/ABI/,,;
 
 	my $nametag = "File $fn";
 	$data{$nametag}->{what} = "File $name";
-- 
2.34.1

